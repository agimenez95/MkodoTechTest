//
//  BallViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Observation
import SwiftUI

enum BallState {
    case normal(matches: Matches)
    case bonusBall(matches: Matches)

    var backgroundColor: Color {
        switch self {
        case .normal(let matches):
            switch matches {
            case .yes:
                    .green
            case .no:
                    .red
            case .notDrawn:
                Color(uiColor: .init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
            }
        case .bonusBall(let matches):
            switch matches {
            case .yes, .notDrawn:
                Color(uiColor: .init(red: 1, green: 215.0/225.0, blue: 0, alpha: 1))
            case .no:
                    .red
            }
        }
    }
}

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
