//
//  ResultDetailViewModelTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class ResultDetailViewModelTests: XCTestCase {

    func testResultDetailViewModel() {
        let sut = ResultsViewModelFactory.makeResultDetailViewModel(for: .makeStub())
        XCTAssertNotNil(sut)
    }

    func testResultDetailViewModel_date() {
        let sut = ResultsViewModelFactory.makeResultDetailViewModel(for: .makeStub())
        XCTAssertEqual(sut.date, Date.makeStub)
    }

    func testResultDetailViewModel_outcomeViewModel() {
        let sut = ResultsViewModelFactory.makeResultDetailViewModel(for: .makeStub())
        XCTAssertTrue((sut.outcomeViewModel as Any) is OutcomeViewModel)
    }

    func testResultDetailViewModel_prizeAmount() {
        let sut = ResultsViewModelFactory.makeResultDetailViewModel(for: .makeStub())
        XCTAssertEqual(sut.prizeAmount, 1000)
    }
}
