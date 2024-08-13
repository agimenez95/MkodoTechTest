//
//  DateFormatterExtensionsTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 12/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class DateFormatterExtensionsTests: XCTestCase {

    var sut: DateFormatter!

    override func setUp() {
        sut = DateFormatter()
    }

    override func tearDown() {
        sut = nil
    }

    func testDateFormatter_getCustomDate_invalidDate() {
        XCTAssertNil(sut.getCustomDate(from: "notADate"))
    }

    func testDateFormatter_getCustomDate_validDate() throws {
        let customDate = try XCTUnwrap(sut.getCustomDate(from: "2024-08-12"))
        let expectedDate = Date(timeIntervalSince1970: 1723495428)

        XCTAssertEqual(Calendar.current.component(.day, from: customDate),
                       Calendar.current.component(.day, from: expectedDate))
        XCTAssertEqual(Calendar.current.component(.month, from: customDate),
                       Calendar.current.component(.month, from: expectedDate))
        XCTAssertEqual(Calendar.current.component(.year, from: customDate),
                       Calendar.current.component(.year, from: expectedDate))
    }

    func testDateFormatter_makeFormattedDateString() {
        let date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(sut.makeFormattedDateString(from: date), "01/01/1970")
    }

    func testDateFormatter_makeFormattedDateString_fromNilDate() {
        XCTAssertNil(sut.makeFormattedDateString(from: nil))
    }
}
