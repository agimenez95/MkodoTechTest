//
//  MyTicketsViewModelFactory.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 14/08/2024.
//

import Foundation

struct MyTicketsViewModelFactory {

    static func makeMyTicketsViewModel(tickets: [Ticket] = [],
                                       draws: [Draw] = [],
                                       myTicketsApiService: MyTicketsApiService = StubDataMyTicketsApiService()) -> MyTicketsViewModel {
        MyTicketsViewModel(tickets: tickets, draws: draws, myTicketsApiService: myTicketsApiService)
    }
}
