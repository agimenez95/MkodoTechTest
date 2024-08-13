//
//  DrawExtensionsTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class DrawExtensionsTests: XCTestCase {

    func testDrawExtensions_makeStub_notNil() {
        let sut = Draw.makeStub()
        XCTAssertNotNil(sut)
    }

    func testDrawExtensions_makeStub_makeOutcomeViewModel_typeIs_OutcomeViewModel() {
        let sut = Draw.makeStub()
        XCTAssertTrue((sut.makeOutcomeViewModel() as Any) is OutcomeViewModel)
    }

    func testDrawExtensions_makeOutcomeViewModel_viewModelValues_match_drawValues() {
        let drawStub = Draw.makeStub()
        let sut = drawStub.makeOutcomeViewModel()
        XCTAssertEqual(sut.number1, drawStub.number1)
        XCTAssertEqual(sut.number2, drawStub.number2)
        XCTAssertEqual(sut.number3, drawStub.number3)
        XCTAssertEqual(sut.number4, drawStub.number4)
        XCTAssertEqual(sut.number5, drawStub.number5)
        XCTAssertEqual(sut.number6, drawStub.number6)
        XCTAssertEqual(sut.bonusBall, drawStub.bonusBall)
    }
}
