//
//  Ticket+Extensions.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation
@testable import MkodoTechTest

extension Ticket {
    
    static func makeStub() -> Ticket {
        Ticket(id: "ticket-1",
               drawId: "draw-1",
               number1: "1",
               number2: "2",
               number3: "3",
               number4: "4",
               number5: "5",
               number6: "6",
               bonusBall: "10")
    }
}
