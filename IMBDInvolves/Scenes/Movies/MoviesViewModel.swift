//
//  MoviesViewModel.swift
//  IMBDInvolves
//
//  Created by Mateus on 31/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MoviesViewModelInput {
    func getUpcomingMovies()
}

protocol MoviesViewModelOutput {
    var isLoading: Driver<Bool> { get }
    var error: Driver<Error> { get }
    var successfullyGetMovies: Driver<MovieResult> { get }
}

protocol MoviesViewModelType {
    var input: MoviesViewModelInput { get }
    var output: MoviesViewModelOutput { get }
}

final class MoviesViewModel: MoviesViewModelType, MoviesViewModelInput, MoviesViewModelOutput {
    
    struct Constants {
        static let one = 1
    }
    
    let isLoading: SharedSequence<DriverSharingStrategy, Bool>
    let error: SharedSequence<DriverSharingStrategy, Error>
    let successfullyGetMovies: SharedSequence<DriverSharingStrategy, MovieResult>
    var page: Int = 0
    
    init(provider: MoviesDataProviderProtocol = MoviesDataProvider()) {
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker()
        
        error = errorTracker.asDriver()
        isLoading = activityTracker.asDriver()
        
        let tryGetUpcomingMovies = Observable.merge(upcomingMoviesproperty)
        
        successfullyGetMovies = tryGetUpcomingMovies
            .asDriverOnErrorJustComplete()
            .flatMapLatest { page -> Driver<MovieResult> in
                return provider.getUpcomingMovies(page: page)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
        }
    }
    
    private let upcomingMoviesproperty = PublishSubject<Int>()
    func getUpcomingMovies() {
        page += Constants.one
        upcomingMoviesproperty.onNext(page)
    }
    
    var input: MoviesViewModelInput { return self }
    var output: MoviesViewModelOutput { return self }
}
