//
//  StubDataMyTicketsApiServiceTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class StubDataMyTicketsApiServiceTests: XCTestCase {

    func testStubDataMyTicketsApiService() {
        let sut = StubDataMyTicketsApiService()
        XCTAssertNotNil(sut)
    }

    func testStubDataMyTicketsApiService_testProvidedStubData_decoded_successfully() async throws {
        let sut = StubDataMyTicketsApiService()
        let response = try await sut.getMyTickets()
        XCTAssertEqual(response.tickets.count, 5)

        XCTAssertEqual(response.tickets[0].id, "ticket-1")
        XCTAssertEqual(response.tickets[0].drawId, "draw-1")
        XCTAssertEqual(response.tickets[0].number1, "2")
        XCTAssertEqual(response.tickets[0].number2, "16")
        XCTAssertEqual(response.tickets[0].number3, "23")
        XCTAssertEqual(response.tickets[0].number4, "44")
        XCTAssertEqual(response.tickets[0].number5, "47")
        XCTAssertEqual(response.tickets[0].number6, "52")
        XCTAssertEqual(response.tickets[0].bonusBall, "14")

        XCTAssertEqual(response.tickets[1].id, "ticket-2")
        XCTAssertEqual(response.tickets[1].drawId, "draw-1")
        XCTAssertEqual(response.tickets[1].number1, "2")
        XCTAssertEqual(response.tickets[1].number2, "36")
        XCTAssertEqual(response.tickets[1].number3, "5")
        XCTAssertEqual(response.tickets[1].number4, "81")
        XCTAssertEqual(response.tickets[1].number5, "37")
        XCTAssertEqual(response.tickets[1].number6, "25")
        XCTAssertEqual(response.tickets[1].bonusBall, "1")

        XCTAssertEqual(response.tickets[2].id, "ticket-3")
        XCTAssertEqual(response.tickets[2].drawId, "draw-2")
        XCTAssertEqual(response.tickets[2].number1, "5")
        XCTAssertEqual(response.tickets[2].number2, "45")
        XCTAssertEqual(response.tickets[2].number3, "51")
        XCTAssertEqual(response.tickets[2].number4, "32")
        XCTAssertEqual(response.tickets[2].number5, "24")
        XCTAssertEqual(response.tickets[2].number6, "18")
        XCTAssertEqual(response.tickets[2].bonusBall, "2")

        XCTAssertEqual(response.tickets[3].id, "ticket-4")
        XCTAssertEqual(response.tickets[3].drawId, "draw-3")
        XCTAssertEqual(response.tickets[3].number1, "4")
        XCTAssertEqual(response.tickets[3].number2, "24")
        XCTAssertEqual(response.tickets[3].number3, "14")
        XCTAssertEqual(response.tickets[3].number4, "5")
        XCTAssertEqual(response.tickets[3].number5, "10")
        XCTAssertEqual(response.tickets[3].number6, "15")
        XCTAssertEqual(response.tickets[3].bonusBall, "51")

        XCTAssertEqual(response.tickets[4].id, "ticket-5")
        XCTAssertEqual(response.tickets[4].drawId, "draw-4")
        XCTAssertEqual(response.tickets[4].number1, "1")
        XCTAssertEqual(response.tickets[4].number2, "2")
        XCTAssertEqual(response.tickets[4].number3, "3")
        XCTAssertEqual(response.tickets[4].number4, "4")
        XCTAssertEqual(response.tickets[4].number5, "5")
        XCTAssertEqual(response.tickets[4].number6, "6")
        XCTAssertEqual(response.tickets[4].bonusBall, "10")
    }

    func testStubDataMyTicketsApiService_testMissingFile_throws_missingFileError() async {
        let sut = StubDataMyTicketsApiService(bundle: Bundle(for: type(of: self)), fileName: "missing")

        do {
            _ = try await sut.getMyTickets()
            XCTFail("The line above should error since the file is missing.")
        } catch {
            XCTAssertEqual(error as? ApiServiceError, ApiServiceError.missingFileError)
        }
    }

    func testStubDataMyTicketsApiService_FaultyJSON_throws_decodingError() async {
        let sut = StubDataMyTicketsApiService(bundle: Bundle(for: type(of: self)), fileName: "FaultyJSON")

        do {
            _ = try await sut.getMyTickets()
            XCTFail("The line above should error since the JSON is faulty.")
        } catch {
            XCTAssertEqual(error as? ApiServiceError, ApiServiceError.decodingError)
        }
    }
}
