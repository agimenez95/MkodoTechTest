//
//  Draw+Extensions.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation

extension Draw {

    init(id: String,
         drawDate: Date,
         number1: String,
         number2: String,
         number3: String,
         number4: String,
         number5: String,
         number6: String,
         bonusBall: String,
         topPrize: Int) {
        self.id = id
        self.drawDate = drawDate
        self.number1 = number1
        self.number2 = number2
        self.number3 = number3
        self.number4 = number4
        self.number5 = number5
        self.number6 = number6
        self.bonusBall = bonusBall
        self.topPrize = topPrize
    }

    func makeOutcomeViewModel() -> OutcomeViewModel {
        OutcomeViewModel(number1: number1,
                         number2: number2,
                         number3: number3,
                         number4: number4,
                         number5: number5,
                         number6: number6,
                         bonusBall: bonusBall)
    }
}
