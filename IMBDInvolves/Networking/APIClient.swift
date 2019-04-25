//
//  APIClient.swift
//  IMDBInvolves
//
//  Created By Mateus on 26/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum APIError: Error {
    case custom(reason: String)
    case noInternetConnection
    case errorDomain
    case unknown
    case connectionExpired
    case http(Error)
    case decodable(Error)
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .custom(let reason):
            return NSLocalizedString(reason, comment: R.string.localizable.errorMessageComment())
        case .noInternetConnection:
            return NSLocalizedString(R.string.localizable.noInternet(), comment: R.string.localizable.errorMessageComment())
        case .errorDomain:
            return NSLocalizedString(R.string.localizable.domainError(), comment: "")
        case .unknown:
            return NSLocalizedString(R.string.localizable.errorMessageGeneric(), comment: R.string.localizable.errorMessageComment())
        case .connectionExpired:
            return NSLocalizedString(R.string.localizable.connectionExpired(), comment: R.string.localizable.errorMessageComment())
        case .http(let error):
            return NSLocalizedString(error.localizedDescription, comment: R.string.localizable.errorMessageComment())
        case .decodable(let error):
            return NSLocalizedString(error.localizedDescription, comment: R.string.localizable.errorMessageComment())
        }
    }
}

protocol RouterType: URLRequestConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var params: [String: Any]? { get }
    var paramsQueryString: [String: Any]? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
    var contentType: String { get }
    var apiKey: String { get }
    var language: String { get }
}

extension RouterType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        if paramsQueryString != nil {
            return URLEncoding.queryString
        }
        return JSONEncoding.default
    }
    
    var contentType: String {
        return "application/json"
    }
    
    var apiKey: String {
        return "167db6b1d2ddae5da387377dd8500fcf"
    }
    
    var language: String {
        return Locale.preferredLanguages[0]
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = try URLRequest(url: url, method: method, headers: headers)
        urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        if paramsQueryString != nil {
            return try encoding.encode(urlRequest, with: paramsQueryString)
        }
        return try encoding.encode(urlRequest, with: params)
    }
}

final class APIClient {
    private let session: SessionManager
    private let successCode: Int = 200
    
    
    init(session: SessionManager = SessionManager.default) {
        self.session = session
    }
    
    /// Makes a request to an endpoint.
    ///
    /// - Parameters:
    ///   - route: The endpoint definition.
    ///   - type: The type that the response will be decoded to.
    /// - Returns: A Observable with the response. The error returned is of type APIError.
    func requestSingle<T: Decodable>(_ route: RouterType, type: T.Type) -> Observable<T> {
        return Observable.create { observer in
            let request = self.session.request(route).responseData { response in
                self.reponseLogging(response)
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode(T.self, from: value)
                        observer.onNext(result)
                        observer.onCompleted()
                    } catch {
                        observer.onError(self.onError(error, value))
                    }
                case .failure(let error):
                    observer.onError(self.onError(error, nil))
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    /// Makes a request to an endpoint.
    ///
    /// - Parameters:
    ///   - route: The endpoint definition.
    ///   - type: The type that the response will be decoded to.
    /// - Returns: A Observable with the list of response. The error returned is of type APIError.
    func requestList<T: Decodable>(_ route: RouterType, type: T.Type) -> Observable<[T]> {
        return Observable.create { observer in
            let request = self.session.request(route).responseData { response in
                self.reponseLogging(response)
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode([T].self, from: value)
                        observer.onNext(result)
                        observer.onCompleted()
                    } catch {
                        observer.onError(APIError.decodable(error))
                    }
                case .failure(let error):
                    observer.onError(APIError.http(error))
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    private func reponseLogging(_ response: DataResponse<Data>) {
        if let aaa = response.request, let body = aaa.httpBody {
            print("Request Parameters: \(String(describing: String(data: body, encoding: .utf8)))")
        }
        
        print("Request: \(String(describing: response.request))")
        print("Response: \(String(describing: response.response))")
        print("Error: \(String(describing: response.error))")
        
        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            print("Data Parsed: \(utf8Text)")
        }
    }
    
    private func onError(_ err: Error, _ response: Data?) -> Error {
        if let value = response,
            let result = try? JSONDecoder().decode(MessageErrorWebService.self, from: value) {
            return APIError.custom(reason: result.message)
        }

        if (err as NSError).code == NSURLErrorTimedOut {
            return APIError.connectionExpired
        }
        
        if (err as NSError).code == NSURLErrorNetworkConnectionLost {
            return APIError.connectionExpired
        }
        
        if (err as NSError).code == NSURLErrorNotConnectedToInternet {
            return APIError.noInternetConnection
        }
        
        if (err as NSError).code == NSURLErrorCannotFindHost {
            return APIError.errorDomain
        }
        return APIError.http(err)
    }
}
