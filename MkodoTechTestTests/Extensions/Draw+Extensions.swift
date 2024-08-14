//
//  Draw+Extensions.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation
@testable import MkodoTechTest

extension Draw {

    static func makeStub() -> Draw {
        Draw(id: "draw-1",
             drawDate: Date.makeStub,
             number1: "2",
             number2: "2",
             number3: "23",
             number4: "4",
             number5: "47",
             number6: "5",
             bonusBall: "14",
             topPrize: 100_000)
    }
}
