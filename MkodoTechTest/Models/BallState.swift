//
//  BallState.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 14/08/2024.
//

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
                Constant.grayColor
            }
        case .bonusBall(let matches):
            switch matches {
            case .yes, .notDrawn:
                Constant.goldColor
            case .no:
                .red
            }
        }
    }
}

private extension BallState {

    enum Constant {
        static let goldColor = Color(uiColor: .init(red: 1, green: 215.0/225.0, blue: 0, alpha: 1))
        static let grayColor = Color(uiColor: .init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
    }
}
