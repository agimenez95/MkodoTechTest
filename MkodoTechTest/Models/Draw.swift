//
//  Draw.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

struct Draw: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id, drawDate, number1, number2, number3, number4, number5, number6, topPrize
        case bonusBall = "bonus-ball"
    }

    var id: String
    var drawDate: Date?
    var number1: String
    var number2: String
    var number3: String
    var number4: String
    var number5: String
    var number6: String
    var bonusBall: String
    var topPrize: Int // in pence

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        let drawDateString = try container.decode(String.self, forKey: .drawDate)
        drawDate = DateFormatter().getCustomDate(from: drawDateString)
        number1 = try container.decode(String.self, forKey: .number1)
        number2 = try container.decode(String.self, forKey: .number2)
        number3 = try container.decode(String.self, forKey: .number3)
        number4 = try container.decode(String.self, forKey: .number4)
        number5 = try container.decode(String.self, forKey: .number5)
        number6 = try container.decode(String.self, forKey: .number6)
        bonusBall = try container.decode(String.self, forKey: .bonusBall)
        topPrize = try container.decode(Int.self, forKey: .topPrize)
    }
}
