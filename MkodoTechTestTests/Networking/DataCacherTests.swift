//
//  DataCacherTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 15/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class DataCacherTests: XCTestCase {

    func testDataCacher() {
        let sut = DataCacher()
        XCTAssertNotNil(sut)
    }

    func testDataCacher_cachedData_canBeFetched() throws {
        let oneMB = 1024 * 1024
        let urlCache = URLCache(memoryCapacity: oneMB, diskCapacity: oneMB)
        let sut = DataCacher(urlCache: urlCache)

        let url = try XCTUnwrap(Endpoint.tickets.url)
        let dummyRequest = URLRequest(url: url)

        let tickets = Tickets(tickets: [.makeStub()])

        let data = try JSONEncoder().encode(tickets)
        let response = HTTPURLResponse()

        sut.cacheData(request: dummyRequest, data: data, response: response)

        let cachedData = try XCTUnwrap(sut.getCachedData(from: url))
        let cachedTickets = try JSONDecoder().decode(Tickets.self, from: cachedData)

        XCTAssertEqual(cachedTickets.tickets.count, 1)
        XCTAssertEqual(tickets.tickets.count, cachedTickets.tickets.count)
        XCTAssertEqual(tickets.tickets[0].id, cachedTickets.tickets[0].id)
        XCTAssertEqual(tickets.tickets[0].drawId, cachedTickets.tickets[0].drawId)
        XCTAssertEqual(tickets.tickets[0].number1, cachedTickets.tickets[0].number1)
        XCTAssertEqual(tickets.tickets[0].number2, cachedTickets.tickets[0].number2)
        XCTAssertEqual(tickets.tickets[0].number3, cachedTickets.tickets[0].number3)
        XCTAssertEqual(tickets.tickets[0].number4, cachedTickets.tickets[0].number4)
        XCTAssertEqual(tickets.tickets[0].number5, cachedTickets.tickets[0].number5)
        XCTAssertEqual(tickets.tickets[0].number6, cachedTickets.tickets[0].number6)
        XCTAssertEqual(tickets.tickets[0].bonusBall, cachedTickets.tickets[0].bonusBall)
    }
}
