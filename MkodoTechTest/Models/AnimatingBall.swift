//
//  AnimatingBall.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 14/08/2024.
//

import Foundation

enum AnimatingBall {
    case ball1
    case ball2
    case ball3
    case ball4
    case ball5
    case ball6
    case bonusBall
    case none

    var next: AnimatingBall {
        switch self {
        case .ball1: .ball2
        case .ball2: .ball3
        case .ball3: .ball4
        case .ball4: .ball5
        case .ball5: .ball6
        case .ball6: .bonusBall
        case .bonusBall: .none
        case .none: .none
        }
    }
}
