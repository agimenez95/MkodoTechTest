//
//  BallViewModelTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

@testable import MkodoTechTest
import SwiftUI
import XCTest

final class BallViewModelTests: XCTestCase {

    func testBallViewModel() {
        let sut = BallViewModel(number: Constant.number)
        XCTAssertNotNil(sut)
    }

    func testBallViewModel_number() {
        let sut = BallViewModel(number: Constant.number)
        XCTAssertEqual(sut.number, Constant.number)
    }

    func testBallViewModel_ballState_normal_notDrawn_backgroundColor_gray() {
        let sut = BallViewModel(number: Constant.number)
        XCTAssertEqual(sut.backgroundColor, Constant.grayColor)
    }


    func testBallViewModel_ballState_normal_match_backgroundColor_green() {
        let sut = BallViewModel(ballState: .normal(matches: .yes), number: Constant.number)
        XCTAssertEqual(sut.backgroundColor, .green)
    }

    func testBallViewModel_ballState_normal_mismatch_backgroundColor_red() {
        let sut = BallViewModel(ballState: .normal(matches: .no), number: Constant.number)
        XCTAssertEqual(sut.backgroundColor, .red)
    }

    func testBallViewModel_ballState_bonusBall_notDrawn_backgroundColor_gold() {
        let sut = BallViewModel(ballState: .bonusBall(matches: .notDrawn), number: Constant.number)
        XCTAssertEqual(sut.backgroundColor, Constant.goldColor)
    }

    func testBallViewModel_ballState_bonusBall_match_backgroundColor_gold() {
        let sut = BallViewModel(ballState: .bonusBall(matches: .yes), number: Constant.number)
        XCTAssertEqual(sut.backgroundColor, Constant.goldColor)
    }

    func testBallViewModel_ballState_bonusBall_mismatch_backgroundColor_red() {
        let sut = BallViewModel(ballState: .bonusBall(matches: .no), number: Constant.number)
        XCTAssertEqual(sut.backgroundColor, .red)
    }

    func testBallViewModel_ballState_bonusBall_notDrawn_borderColor_gold() {
        let sut = BallViewModel(ballState: .bonusBall(matches: .notDrawn), number: Constant.number)
        XCTAssertEqual(sut.borderColor, Constant.goldColor)
    }

    func testBallViewModel_ballState_bonusBall_match_borderColor_gold() {
        let sut = BallViewModel(ballState: .bonusBall(matches: .yes), number: Constant.number)
        XCTAssertEqual(sut.borderColor, Constant.goldColor)
    }

    func testBallViewModel_ballState_bonusBall_mismatch_borderColor_gold() {
        let sut = BallViewModel(ballState: .bonusBall(matches: .no), number: Constant.number)
        XCTAssertEqual(sut.borderColor, Constant.goldColor)
    }

    func testBallViewModel_ballState_normal_notDrawn_borderColor_gray() {
        let sut = BallViewModel(ballState: .normal(matches: .notDrawn), number: Constant.number)
        XCTAssertEqual(sut.borderColor, Constant.grayColor)
    }

    func testBallViewModel_ballState_normal_match_borderColor_green() {
        let sut = BallViewModel(ballState: .normal(matches: .yes), number: Constant.number)
        XCTAssertEqual(sut.borderColor, .green)
    }

    func testBallViewModel_ballState_normal_mismatch_borderColor_red() {
        let sut = BallViewModel(ballState: .normal(matches: .no), number: Constant.number)
        XCTAssertEqual(sut.borderColor, .red)
    }
}

private extension BallViewModelTests {

    private enum Constant {
        static let number = "1"
        static let grayColor = Color(uiColor: .init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
        static let goldColor = Color(uiColor: .init(red: 1, green: 215.0/225.0, blue: 0, alpha: 1))
    }
}
