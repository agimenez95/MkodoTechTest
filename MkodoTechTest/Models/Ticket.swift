//
//  Ticket.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation

struct Ticket: Codable, Identifiable {
    var id: String
    var drawId: String
    var number1: String
    var number2: String
    var number3: String
    var number4: String
    var number5: String
    var number6: String
    var bonusBall: String
}
