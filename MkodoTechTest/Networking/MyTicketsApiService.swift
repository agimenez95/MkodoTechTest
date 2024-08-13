//
//  MyTicketsApiService.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation

protocol MyTicketsApiService: AnyObject {
    func getMyTickets() async throws -> Tickets
}
