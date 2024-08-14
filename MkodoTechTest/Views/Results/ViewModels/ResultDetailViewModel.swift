//
//  ResultDetailViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import SwiftUI
import Observation

@Observable
final class ResultDetailViewModel {

    var prizeAmount: Double {
        Double(draw.topPrize) / Constant.oneHundred
    }

    var outcomeViewModel: OutcomeViewModel {
        draw.makeOutcomeViewModel()
    }

    var date: Date {
        draw.drawDate
    }

    var currencyCode = Constant.gbpCurrencyCode

    private var draw: Draw

    init(draw: Draw) {
        self.draw = draw
    }
}

private extension ResultDetailViewModel {

    enum Constant {
        static let gbpCurrencyCode = "GBP"
        static let oneHundred = 100.0
    }
}
