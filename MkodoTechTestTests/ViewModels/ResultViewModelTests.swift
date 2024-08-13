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
        let sut = ResultViewModel(draw: .makeStub())
        XCTAssertNotNil(sut)
    }

    func testResultViewModel_dateText_formatsDateCorrectly() {
        let sut = ResultViewModel(draw: .makeStub())
        XCTAssertEqual(sut.dateText, "13/08/2024")
    }

    func testResultViewModel_dateText_fromNilDate() {
        var stubDraw = Draw.makeStub()
        stubDraw.drawDate = nil
        let sut = ResultViewModel(draw: stubDraw)
        XCTAssertEqual(sut.dateText, "")
    }

    func testResultViewModel_outcomeViewModel() {
        let sut = ResultViewModel(draw: .makeStub())
        XCTAssertTrue((sut.outcomeViewModel as Any) is OutcomeViewModel)
    }
}
