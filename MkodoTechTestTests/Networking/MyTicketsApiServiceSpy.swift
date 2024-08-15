//
//  MyTicketsApiServiceSpy.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation
@testable import MkodoTechTest

final class MyTicketsApiServiceSpy: MyTicketsApiServiceUseCase {

    var didCallGetMyTickets = false
    var getTicketsInjection: Tickets?

    func getMyTickets() async throws -> Tickets {
        didCallGetMyTickets = true
        return getTicketsInjection ?? Tickets(tickets: [.makeStub()])
    }
}
