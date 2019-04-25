//
//  MoviewViewModelTest.swift
//  IMBDInvolvesTests
//
//  Created by Mateus on 03/08/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxCocoa

@testable import IMBDInvolves

class MoviesViewModelTest: XCTestCase {
    
    private var viewModel: MoviesViewModelType!
    var testScheduler: TestScheduler!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        testScheduler = TestScheduler(initialClock: 0)
        viewModel = MoviesViewModel(provider: MoviesDataProviderMock())
    }
    
    override func tearDown() {
        super.tearDown()
        testScheduler = nil
        viewModel = nil
    }
    
    func testWhenGetList() {
        let observer = testScheduler.createObserver(MovieResult.self)
        viewModel.output.successfullyGetMovies.drive(observer)
            .disposed(by: disposeBag)
        testScheduler.start()
        
        viewModel.input.getUpcomingMovies()
        XCTAssertEqual(observer.events.count, 1)
    }
}

final class MoviesDataProviderMock: MoviesDataProviderProtocol {
    func getUpcomingMovies(page: Int) -> Observable<MovieResult> {
        return Observable.just(MovieResult(results: []))
    }
}
