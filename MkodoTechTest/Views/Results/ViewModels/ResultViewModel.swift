//
//  ResultViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation
import Observation

@Observable
final class ResultViewModel {

    var date: Date {
        draw.drawDate
    }

    var outcomeViewModel: OutcomeViewModel {
        draw.makeOutcomeViewModel()
    }

    private var draw: Draw
    private let dateFormatter: DateFormatter

    init(draw: Draw, dateFormatter: DateFormatter = .init()) {
        self.draw = draw
        self.dateFormatter = dateFormatter
    }
}
