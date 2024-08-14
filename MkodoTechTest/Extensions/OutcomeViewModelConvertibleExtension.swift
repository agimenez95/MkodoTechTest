//
//  Draw+Extensions.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation

protocol OutcomeViewModelConvertible {
    var number1: String { get set }
    var number2: String { get set }
    var number3: String { get set }
    var number4: String { get set }
    var number5: String { get set }
    var number6: String { get set }
    var bonusBall: String { get set }
}

extension OutcomeViewModelConvertible {

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

extension Draw: OutcomeViewModelConvertible { }
extension Ticket: OutcomeViewModelConvertible { }
