//
//  DrawsApiServiceTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 15/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class DrawsApiServiceTests: XCTestCase {

    func testDrawsApiService() {
        let sut = DrawsApiService()
        XCTAssertNotNil(sut)
    }

    func testDrawsApiService_dateFormat() {
        let sut = DrawsApiService()
        XCTAssertEqual(sut.dateFormat, Constant.expectedDateFormat)
    }

    func testDrawsApiService_dateFormat_setOnSpy() {
        let sut = DrawsApiServiceSpy()
        XCTAssertEqual(sut.dateFormat, Constant.expectedDateFormat)
    }

    func testDrawsApiService_testProvidedStubData_decoded_successfully() async throws {
        let sut = DrawsApiService()
        let response = try await sut.getDraws()
        XCTAssertEqual(response.draws.count, 3)

        XCTAssertEqual(response.draws[0].id, "draw-1")
        XCTAssertEqual(response.draws[0].drawDate, getCustomDate(from: "2023-05-15"))
        XCTAssertEqual(response.draws[0].number1, "2")
        XCTAssertEqual(response.draws[0].number2, "16")
        XCTAssertEqual(response.draws[0].number3, "23")
        XCTAssertEqual(response.draws[0].number4, "44")
        XCTAssertEqual(response.draws[0].number5, "47")
        XCTAssertEqual(response.draws[0].number6, "52")
        XCTAssertEqual(response.draws[0].bonusBall, "14")
        XCTAssertEqual(response.draws[0].topPrize, 4_000_000_000)

        XCTAssertEqual(response.draws[1].id, "draw-2")
        XCTAssertEqual(response.draws[1].drawDate, getCustomDate(from: "2023-05-22"))
        XCTAssertEqual(response.draws[1].number1, "5")
        XCTAssertEqual(response.draws[1].number2, "45")
        XCTAssertEqual(response.draws[1].number3, "51")
        XCTAssertEqual(response.draws[1].number4, "32")
        XCTAssertEqual(response.draws[1].number5, "24")
        XCTAssertEqual(response.draws[1].number6, "18")
        XCTAssertEqual(response.draws[1].bonusBall, "28")
        XCTAssertEqual(response.draws[1].topPrize, 6_000_000_000)

        XCTAssertEqual(response.draws[2].id, "draw-3")
        XCTAssertEqual(response.draws[2].drawDate, getCustomDate(from: "2023-05-29"))
        XCTAssertEqual(response.draws[2].number1, "34")
        XCTAssertEqual(response.draws[2].number2, "21")
        XCTAssertEqual(response.draws[2].number3, "4")
        XCTAssertEqual(response.draws[2].number4, "58")
        XCTAssertEqual(response.draws[2].number5, "1")
        XCTAssertEqual(response.draws[2].number6, "15")
        XCTAssertEqual(response.draws[2].bonusBall, "51")
        XCTAssertEqual(response.draws[2].topPrize, 6_000_000_000)
    }
}

private extension DrawsApiServiceTests {

    enum Constant {
        static let expectedDateFormat = "yyyy-MM-dd"
    }

    func getCustomDate(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constant.expectedDateFormat
        return dateFormatter.date(from: string)
    }
}
