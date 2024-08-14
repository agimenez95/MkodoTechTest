//
//  ResultViewModelTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 12/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class ResultViewModelTests: XCTestCase {

    func testResultViewModel() {
        let sut = ResultsViewModelFactory.makeResultViewModel(for: .makeStub())
        XCTAssertNotNil(sut)
    }

    func testResultViewModel_date() {
        let sut = ResultsViewModelFactory.makeResultViewModel(for: .makeStub())
        XCTAssertEqual(sut.date, Date.makeStub)
    }

    func testResultViewModel_outcomeViewModel() {
        let sut = ResultsViewModelFactory.makeResultViewModel(for: .makeStub())
        XCTAssertTrue((sut.outcomeViewModel as Any) is OutcomeViewModel)
    }
}
