//
//  MyTicketsViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Observation
import SwiftUI

enum DateSection: Hashable {
    case date(date: Date)
    case upcoming
}

@Observable
final class MyTicketsViewModel {

    let navigationTitle = Constant.myTickets
    let upcomingSectionTitle = Constant.upcoming

    var sections: [DateSection] = []

    var isErrorPresented = false
    var error: ApiServiceError?

    private var tickets: [Ticket]
    private let myTicketsApiService: MyTicketsApiServiceUseCase
    private var results: [String: Draw] = [:]

    init(tickets: [Ticket] = [],
         draws: [Draw] = [],
         myTicketsApiService: MyTicketsApiServiceUseCase = MyTicketsApiService()) {
        self.tickets = tickets
        self.myTicketsApiService = myTicketsApiService
        for draw in draws {
            results[draw.id] = draw
        }

        setSections()
    }

    func getTickets() async {
        do {
            tickets = try await myTicketsApiService.getMyTickets().tickets
            setSections()
        } catch {
            self.error = error as? ApiServiceError
            isErrorPresented = true
        }
    }

    func tickets(in sectionType: DateSection) -> [Ticket] {
        switch sectionType {
        case .upcoming:
            return tickets.filter { results[$0.drawId] == nil }
        case .date(let date):
            guard let filteredResult = results.first(where: { $0.value.drawDate == date }) else {
                return []
            }

            return tickets.filter({ $0.drawId == filteredResult.key }).sorted(by: { $0.id > $1.id })
        }

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
        static let myTickets: LocalizedStringKey = "MY_TICKETS"
        static let upcoming: LocalizedStringKey = "UPCOMING"
    }

    func setSections() {
        var addUpcomingSection = false
        var dates = Set<Date>()

        for ticket in tickets {
            if let draw = results[ticket.drawId] {
                dates.insert(draw.drawDate)
            } else {
                addUpcomingSection = true
            }
        }

        var newSections = Array(dates).sorted(by: { $0 > $1 }).map { DateSection.date(date: $0) }

        if addUpcomingSection {
            newSections.insert(.upcoming, at: 0)
        }

        sections = newSections
    }
}
