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
                                       apiService: MyTicketsApiServiceUseCase = MyTicketsApiService()) -> MyTicketsViewModel {
        MyTicketsViewModel(tickets: tickets, draws: draws, myTicketsApiService: apiService)
    }
}
