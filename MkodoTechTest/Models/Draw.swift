//
//  Draw.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

struct Draw: Decodable, Identifiable {

    private enum CodingKeys: String, CodingKey {
        case id, drawDate, number1, number2, number3, number4, number5, number6, topPrize
        case bonusBall = "bonus-ball"
    }

    var id: String
    var drawDate: Date
    var number1: String
    var number2: String
    var number3: String
    var number4: String
    var number5: String
    var number6: String
    var bonusBall: String
    var topPrize: Int // in pence
}
