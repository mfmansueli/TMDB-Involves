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
        viewModel = MoviesViewModel()
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
    
    //    func testWhenCpfIsInvalid() {
    //        viewModel.input.cpfChanged("12217344235")
    //        viewModel.input.passwordChanged("")
    //        let observer = testScheduler.createObserver(String.self)
    //        viewModel.output.dataError.drive(observer)
    //            .disposed(by: disposeBag)
    //        testScheduler.start()
    //
    //        viewModel.input.loginTapped()
    //        XCTAssertEqual(observer.events.count, 1)
    //    }
    //
    //    func testWhenPasswordIsEmpty() {
    //        viewModel.input.cpfChanged("12217344234")
    //        viewModel.input.passwordChanged("")
    //        let observer = testScheduler.createObserver(String.self)
    //        viewModel.output.dataError.drive(observer)
    //            .disposed(by: disposeBag)
    //        testScheduler.start()
    //
    //        viewModel.input.loginTapped()
    //        XCTAssertEqual(observer.events.count, 1)
    //    }
    //
    //    func testWhenCpfAndPasswordIsValid() {
    //        viewModel.input.cpfChanged("12217344234")
    //        viewModel.input.passwordChanged("1234")
    //        let observer = testScheduler.createObserver(String.self)
    //        viewModel.output.dataError.drive(observer)
    //            .disposed(by: disposeBag)
    //        testScheduler.start()
    //
    //        viewModel.input.loginTapped()
    //        XCTAssertEqual(observer.events.count, 0)
    //    }
    //
    //    func testWhenErrorLogin() {
    //        viewModel.input.cpfChanged("12217344234")
    //        viewModel.input.passwordChanged("1234")
    //        let observer = testScheduler.createObserver(Void.self)
    //        viewModel.output.successfullyLoggedIn.drive(observer)
    //            .disposed(by: disposeBag)
    //        testScheduler.start()
    //
    //        viewModel.input.loginTapped()
    //        XCTAssertEqual(observer.events.count, 0)
    //    }
}
