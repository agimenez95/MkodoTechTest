//
//  TicketExtensionTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class TicketExtensionTests: XCTestCase {

    func testTicketExtension_makeStub_notNil() {
        let sut = Ticket.makeStub()
        XCTAssertNotNil(sut)
    }

    func testTicketExtension_makeStub_makeOutcomeViewModel_typeIs_OutcomeViewModel() {
        let sut = Ticket.makeStub()
        XCTAssertTrue((sut.makeOutcomeViewModel() as Any) is OutcomeViewModel)
    }

    func testTicketExtension_makeOutcomeViewModel_viewModelValues_match_ticketValues() {
        let ticketStub = Ticket.makeStub()
        let sut = ticketStub.makeOutcomeViewModel()
        XCTAssertEqual(sut.number1, ticketStub.number1)
        XCTAssertEqual(sut.number2, ticketStub.number2)
        XCTAssertEqual(sut.number3, ticketStub.number3)
        XCTAssertEqual(sut.number4, ticketStub.number4)
        XCTAssertEqual(sut.number5, ticketStub.number5)
        XCTAssertEqual(sut.number6, ticketStub.number6)
        XCTAssertEqual(sut.bonusBall, ticketStub.bonusBall)
    }
}
