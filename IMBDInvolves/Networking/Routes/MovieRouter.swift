//
//  AuthRouter.swift
//  IMDBInvolves
//
//  Created By Mateus on 26/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation
import Alamofire

enum MovieRouter {
    case upcomingMovie(page: Int)
}

// MARK: - RouterType implementation
extension MovieRouter: RouterType {
    var path: String {
        switch self {
        case .upcomingMovie:
            return "movie/upcoming"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .upcomingMovie:
            return .get
        }
    }

    var params: [String : Any]? {
        switch self {
        case .upcomingMovie:
            return nil
        }
    }
    
    var paramsQueryString: [String : Any]? {
        switch self {
        case .upcomingMovie(let page):
            return ["api_key": apiKey, "language": language, "page": page]
        default: return nil
        }
    }
}
