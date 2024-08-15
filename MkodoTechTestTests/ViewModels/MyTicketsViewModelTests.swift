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

    func testMyTicketsViewModel_sections_isEmpty_false() async {
        let sut = MyTicketsViewModelFactory.makeMyTicketsViewModel()
        await sut.getTickets()
        XCTAssertFalse(sut.sections.isEmpty)
    }

    func testMyTicketsViewModel_getTickets_calls_getMyTickets_in_MyTicketsApiService() async {
        let apiServiceSpy = MyTicketsApiServiceSpy()
        let sut = MyTicketsViewModelFactory.makeMyTicketsViewModel(apiService: apiServiceSpy)
        XCTAssertFalse(apiServiceSpy.didCallGetMyTickets)

        await sut.getTickets()
        XCTAssertTrue(apiServiceSpy.didCallGetMyTickets)
    }

    func testMyTicketsViewModel_Upcoming_SectionType() async  {
        let sut = MyTicketsViewModelFactory.makeMyTicketsViewModel()
        await sut.getTickets()
        XCTAssertEqual(sut.sections.count, 1)
        XCTAssertEqual(sut.sections[0], .upcoming)
    }

    func testMyTicketsViewModel_ticketsInSectionName_Upcoming() async {
        let sut = MyTicketsViewModelFactory.makeMyTicketsViewModel()
        await sut.getTickets()
        XCTAssertEqual(sut.tickets(in: .upcoming).count, 5)
    }

    func testMyTicketsViewModel_ticketsInSectionName_withMatchingDate() async {
        let sut = MyTicketsViewModelFactory.makeMyTicketsViewModel(draws: [.makeStub()])
        await sut.getTickets()
        XCTAssertEqual(sut.tickets(in: .date(date: Date.makeStub)).count, 2)
    }

    func testMyTicketsViewModel_ticketsInSectionName_mismatchedSectionName() async {
        let sut = MyTicketsViewModelFactory.makeMyTicketsViewModel(draws: [.makeStub()])
        await sut.getTickets()
        XCTAssertEqual(sut.tickets(in: .date(date: Date(timeIntervalSince1970: 0))).count, 0)
    }

    func testMyTicketsViewModel_makeOutcomeViewModel_outcomeNotDrawn() async throws {
        let sut = MyTicketsViewModelFactory.makeMyTicketsViewModel(draws: [])

        await sut.getTickets()

        let firstTicket = try XCTUnwrap(sut.tickets(in: .upcoming).first)
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
        let sut = MyTicketsViewModelFactory.makeMyTicketsViewModel(draws: [.makeStub()])

        await sut.getTickets()

        let tickets = sut.tickets(in: .date(date: Date.makeStub))
        let firstTicket = try XCTUnwrap(tickets.first(where: { $0.id == "ticket-1" }))

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
