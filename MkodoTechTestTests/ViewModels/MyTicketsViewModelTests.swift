//
//  MyTicketsViewModelTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class MyTicketsViewModelTests: XCTestCase {

    func testMyTicketsViewModel() {
        let sut = MyTicketsViewModel()
        XCTAssertNotNil(sut)
    }

    func testMyTicketsViewModel_sections_isEmpty_false() async throws {
        let sut = MyTicketsViewModel()
        try await sut.getTickets()
        XCTAssertFalse(sut.sections.isEmpty)
    }

    func testMyTicketsViewModel_getTickets_calls_getMyTickets_in_MyTicketsApiService() async throws {
        let apiServiceSpy = MyTicketsApiServiceSpy()
        let sut = MyTicketsViewModel(myTicketsApiService: apiServiceSpy)
        XCTAssertFalse(apiServiceSpy.didCallGetMyTickets)

        try await sut.getTickets()
        XCTAssertTrue(apiServiceSpy.didCallGetMyTickets)
    }

    func testMyTicketsViewModel_Upcoming_SectionName() async throws {
        let sut = MyTicketsViewModel()
        try await sut.getTickets()
        XCTAssertEqual(sut.sections.count, 1)
        XCTAssertEqual(sut.sections[0], "Upcoming")
    }

    func testMyTicketsViewModel_ticketsInSectionName_Upcoming() async throws {
        let sut = MyTicketsViewModel()
        try await sut.getTickets()
        XCTAssertEqual(sut.tickets(in: "Upcoming").count, 5)
    }

    func testMyTicketsViewModel_ticketsInSectionName_withMatchingDate() async throws {
        let sut = MyTicketsViewModel(draws: [.makeStub()])
        try await sut.getTickets()
        XCTAssertEqual(sut.tickets(in: "13/08/2024").count, 2)
    }

    func testMyTicketsViewModel_ticketsInSectionName_mismatchedSectionName() async throws {
        let sut = MyTicketsViewModel(draws: [.makeStub()])
        try await sut.getTickets()
        XCTAssertEqual(sut.tickets(in: "1").count, 0)
    }

    func testMyTicketsViewModel_makeOutcomeViewModel_outcomeNotDrawn() async throws {
        let sut = MyTicketsViewModel(draws: [])
        
        try await sut.getTickets()

        let firstTicket = try XCTUnwrap(sut.tickets(in: "Upcoming").first)
        let viewModel = sut.makeOutcomeViewModel(for: firstTicket)
        
        XCTAssertTrue((viewModel as Any) is OutcomeViewModel)
        XCTAssertEqual(viewModel.matchesNumber1, .notDrawn)
        XCTAssertEqual(viewModel.matchesNumber2, .notDrawn)
        XCTAssertEqual(viewModel.matchesNumber3, .notDrawn)
        XCTAssertEqual(viewModel.matchesNumber4, .notDrawn)
        XCTAssertEqual(viewModel.matchesNumber5, .notDrawn)
        XCTAssertEqual(viewModel.matchesNumber6, .notDrawn)
        XCTAssertEqual(viewModel.matchesBonusBall, .notDrawn)
    }

    func testMyTicketsViewModel_makeOutcomeViewModel_outcomeDrawn() async throws {
        let sut = MyTicketsViewModel(draws: [.makeStub()])
        
        try await sut.getTickets()

        let firstTicket = try XCTUnwrap(sut.tickets(in: "13/08/2024").first(where: { $0.id == "ticket-1" }))
        let viewModel = sut.makeOutcomeViewModel(for: firstTicket)

        XCTAssertTrue((viewModel as Any) is OutcomeViewModel)
        XCTAssertEqual(viewModel.matchesNumber1, .yes)
        XCTAssertEqual(viewModel.matchesNumber2, .no)
        XCTAssertEqual(viewModel.matchesNumber3, .yes)
        XCTAssertEqual(viewModel.matchesNumber4, .no)
        XCTAssertEqual(viewModel.matchesNumber5, .yes)
        XCTAssertEqual(viewModel.matchesNumber6, .no)
        XCTAssertEqual(viewModel.matchesBonusBall, .yes)
    }
}
