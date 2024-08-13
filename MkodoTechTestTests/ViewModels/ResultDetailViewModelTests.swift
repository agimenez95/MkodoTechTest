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
        let sut = ResultDetailViewModel(draw: .makeStub())
        XCTAssertNotNil(sut)
    }

    func testResultDetailViewModel_dateText() {
        let sut = ResultDetailViewModel(draw: .makeStub())
        XCTAssertEqual(sut.dateText, "13/08/2024")
    }

    func testResultDetailViewModel_dateText_fromNilDate() {
        var stubDraw = Draw.makeStub()
        stubDraw.drawDate = nil
        let sut = ResultDetailViewModel(draw: stubDraw)
        XCTAssertEqual(sut.dateText, "")
    }

    func testResultDetailViewModel_outcomeViewModel() {
        let sut = ResultDetailViewModel(draw: .makeStub())
        XCTAssertTrue((sut.outcomeViewModel as Any) is OutcomeViewModel)
    }

    func testResultDetailViewModel_prizeAmount() {
        let sut = ResultDetailViewModel(draw: .makeStub())
        XCTAssertEqual(sut.prizeAmount, "£1,000.00")
    }
}
