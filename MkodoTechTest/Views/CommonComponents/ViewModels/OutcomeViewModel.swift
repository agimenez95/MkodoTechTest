//
//  OutcomeViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Observation
import SwiftUI

@Observable
final class OutcomeViewModel {

    var number1: String
    var number2: String
    var number3: String
    var number4: String
    var number5: String
    var number6: String
    var bonusBall: String

    var matchesNumber1: Matches
    var matchesNumber2: Matches
    var matchesNumber3: Matches
    var matchesNumber4: Matches
    var matchesNumber5: Matches
    var matchesNumber6: Matches
    var matchesBonusBall: Matches

    var shouldAnimate: Bool
    var isAnimating: Bool = false

    init(number1: String,
         number2: String,
         number3: String,
         number4: String,
         number5: String,
         number6: String,
         bonusBall: String,
         matchesNumber1: Matches = .notDrawn,
         matchesNumber2: Matches = .notDrawn,
         matchesNumber3: Matches = .notDrawn,
         matchesNumber4: Matches = .notDrawn,
         matchesNumber5: Matches = .notDrawn,
         matchesNumber6: Matches = .notDrawn,
         matchesBonusBall: Matches = .notDrawn,
         shouldAnimate: Bool = false) {
        self.number1 = number1
        self.number2 = number2
        self.number3 = number3
        self.number4 = number4
        self.number5 = number5
        self.number6 = number6
        self.bonusBall = bonusBall
        self.matchesNumber1 = matchesNumber1
        self.matchesNumber2 = matchesNumber2
        self.matchesNumber3 = matchesNumber3
        self.matchesNumber4 = matchesNumber4
        self.matchesNumber5 = matchesNumber5
        self.matchesNumber6 = matchesNumber6
        self.matchesBonusBall = matchesBonusBall
        self.shouldAnimate = shouldAnimate
    }

}
