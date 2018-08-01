//
//  MoviesDataProviderViewController.swift
//  IMBDInvolves
//
//  Created by Mateus on 11/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation
import RxSwift

protocol MoviesDataProviderProtocol {
    func getUpcomingMovies(page: Int) -> Observable<MovieResult>
}

final class MoviesDataProvider: MoviesDataProviderProtocol {
//    private let movieRepository = Repository<MovieResult>()
    let apiClient: APIClient = APIClient()
    func getUpcomingMovies(page: Int) -> Observable<MovieResult> {
                return apiClient.requestSingle(MovieRouter.upcomingMovie(page: page), type: MovieResult.self)
        }
    }
