//
//  ResultDetailViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation
import Observation

@Observable
final class ResultDetailViewModel {

    var prizeAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .init(identifier: "en_GB")
        let price = (Double(draw.topPrize) / 100.0) as NSNumber
        return formatter.string(from: price) ?? ""
    }

    var outcomeViewModel: OutcomeViewModel {
        draw.makeOutcomeViewModel()
    }

    var dateText: String {
        DateFormatter().makeFormattedDateString(from: draw.drawDate) ?? ""
    }

    private var draw: Draw

    init(draw: Draw) {
        self.draw = draw
    }
}
