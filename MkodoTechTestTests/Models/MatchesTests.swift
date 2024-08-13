//
//  MatchesTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class MatchesTests: XCTestCase {

    func testMatches_yes() {
        XCTAssertEqual(Matches.match(lhs: "1", rhs: "1"), .yes)
    }

    func testMatches_no() {
        XCTAssertEqual(Matches.match(lhs: "1", rhs: "2"), .no)
    }
}
