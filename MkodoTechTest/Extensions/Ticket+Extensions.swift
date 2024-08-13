//
//  Ticket+Extensions.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation

extension Ticket {

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
