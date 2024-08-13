//
//  StubDataLottoResultsApiServiceTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 12/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class StubDataLottoResultsApiServiceTests: XCTestCase {

    func testStubDataLottoResultsApiService() {
        let sut = StubDataLottoResultsApiService()
        XCTAssertNotNil(sut)
    }

    func testStubDataLottoResultsApiService_testProvidedStubData_decoded_successfully() async throws {
        let sut = StubDataLottoResultsApiService()
        let response = try await sut.getLottoResults()
        XCTAssertEqual(response.draws.count, 3)

        XCTAssertEqual(response.draws[0].id, "draw-1")
        XCTAssertEqual(response.draws[0].drawDate, DateFormatter().getCustomDate(from: "2023-05-15"))
        XCTAssertEqual(response.draws[0].number1, "2")
        XCTAssertEqual(response.draws[0].number2, "16")
        XCTAssertEqual(response.draws[0].number3, "23")
        XCTAssertEqual(response.draws[0].number4, "44")
        XCTAssertEqual(response.draws[0].number5, "47")
        XCTAssertEqual(response.draws[0].number6, "52")
        XCTAssertEqual(response.draws[0].bonusBall, "14")
        XCTAssertEqual(response.draws[0].topPrize, 4000000000)

        XCTAssertEqual(response.draws[1].id, "draw-2")
        XCTAssertEqual(response.draws[1].drawDate, DateFormatter().getCustomDate(from: "2023-05-22"))
        XCTAssertEqual(response.draws[1].number1, "5")
        XCTAssertEqual(response.draws[1].number2, "45")
        XCTAssertEqual(response.draws[1].number3, "51")
        XCTAssertEqual(response.draws[1].number4, "32")
        XCTAssertEqual(response.draws[1].number5, "24")
        XCTAssertEqual(response.draws[1].number6, "18")
        XCTAssertEqual(response.draws[1].bonusBall, "28")
        XCTAssertEqual(response.draws[1].topPrize, 6000000000)

        XCTAssertEqual(response.draws[2].id, "draw-3")
        XCTAssertEqual(response.draws[2].drawDate, DateFormatter().getCustomDate(from: "2023-05-29"))
        XCTAssertEqual(response.draws[2].number1, "34")
        XCTAssertEqual(response.draws[2].number2, "21")
        XCTAssertEqual(response.draws[2].number3, "4")
        XCTAssertEqual(response.draws[2].number4, "58")
        XCTAssertEqual(response.draws[2].number5, "1")
        XCTAssertEqual(response.draws[2].number6, "15")
        XCTAssertEqual(response.draws[2].bonusBall, "51")
        XCTAssertEqual(response.draws[2].topPrize, 6000000000)
    }

    func testStubDataLottoResultsApiService_testMissingFile_throws_missingFileError() async {
        let sut = StubDataLottoResultsApiService(bundle: Bundle(for: type(of: self)), fileName: "missing")

        do {
            _ = try await sut.getLottoResults()
            XCTFail("The line above should error since the file is missing.")
        } catch {
            XCTAssertEqual(error as? ApiServiceError, ApiServiceError.missingFileError)
        }
    }

    func testStubDataLottoResultsApiService_FaultyJSON_throws_decodingError() async {
        let sut = StubDataLottoResultsApiService(bundle: Bundle(for: type(of: self)), fileName: "FaultyJSON")

        do {
            _ = try await sut.getLottoResults()
            XCTFail("The line above should error since the file is missing.")
        } catch {
            XCTAssertEqual(error as? ApiServiceError, ApiServiceError.decodingError)
        }
    }
}
