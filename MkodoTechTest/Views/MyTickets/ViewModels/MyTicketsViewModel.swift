//
//  MyTicketsViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation
import Observation

@Observable
final class MyTicketsViewModel {

    var sections: [String] = []

    private var tickets: [Ticket]
    private let myTicketsApiService: MyTicketsApiService
    private var results: [String: Draw] = [:]

    init(tickets: [Ticket] = [], draws: [Draw] = [], myTicketsApiService: MyTicketsApiService = StubDataMyTicketsApiService()) {
        self.tickets = tickets
        self.myTicketsApiService = myTicketsApiService
        for draw in draws {
            results[draw.id] = draw
        }

        setSections()
    }

    func getTickets() async throws {
        tickets = try await myTicketsApiService.getMyTickets().tickets
        setSections()
    }

    func tickets(in sectionName: String) -> [Ticket] {
        if sectionName == Constant.upcoming {
            return tickets.filter { results[$0.drawId] == nil }
        }

        guard let filteredResult = results.first(where: { convertDateToString(date: $0.value.drawDate) == sectionName }) else {
            return []
        }

        return tickets.filter({ $0.drawId == filteredResult.key }).sorted(by: { $0.id > $1.id })
    }

    func makeOutcomeViewModel(for ticket: Ticket) -> OutcomeViewModel {
        let viewModel = ticket.makeOutcomeViewModel()
        guard let draw = results[ticket.drawId] else {
            return viewModel
        }

        viewModel.matchesNumber1 = Matches.match(lhs: draw.number1, rhs: ticket.number1)
        viewModel.matchesNumber2 = Matches.match(lhs: draw.number2, rhs: ticket.number2)
        viewModel.matchesNumber3 = Matches.match(lhs: draw.number3, rhs: ticket.number3)
        viewModel.matchesNumber4 = Matches.match(lhs: draw.number4, rhs: ticket.number4)
        viewModel.matchesNumber5 = Matches.match(lhs: draw.number5, rhs: ticket.number5)
        viewModel.matchesNumber6 = Matches.match(lhs: draw.number6, rhs: ticket.number6)
        viewModel.matchesBonusBall = Matches.match(lhs: draw.bonusBall, rhs: ticket.bonusBall)

        return viewModel
    }
}

private extension MyTicketsViewModel {

    enum Constant {
        static let upcoming = "Upcoming"
    }

    func setSections() {
        var newSections = [String]()
        var addNextSection = false

        for ticket in tickets {
            if let draw = results[ticket.drawId],
               let date = draw.drawDate,
               let dateString = convertDateToString(date: date),
               !newSections.contains(dateString) {
                newSections.append(dateString)
            } else {
                addNextSection = true
            }
        }

        newSections = newSections.sorted { $0 > $1 }

        if addNextSection {
            newSections.insert(Constant.upcoming, at: 0)
        }

        sections = newSections
    }

    func convertDateToString(date: Date?) -> String? {
        DateFormatter().makeFormattedDateString(from: date)
    }
}
