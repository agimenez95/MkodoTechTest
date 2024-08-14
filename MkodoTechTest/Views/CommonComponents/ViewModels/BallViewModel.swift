//
//  BallViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Observation
import SwiftUI

@Observable
final class BallViewModel {

    var number: String

    var backgroundColor: Color {
        ballState.backgroundColor
    }

    var borderColor: Color {
        switch ballState {
        case .normal:
            ballState.backgroundColor
        case .bonusBall:
            BallState.bonusBall(matches: .notDrawn).backgroundColor
        }
    }

    private var ballState: BallState

    init(ballState: BallState = .normal(matches: .notDrawn), number: String) {
        self.ballState = ballState
        self.number = number
    }
}
