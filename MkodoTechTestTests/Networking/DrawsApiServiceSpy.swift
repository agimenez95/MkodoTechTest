//
//  DrawsApiServiceSpy.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation
@testable import MkodoTechTest

final class DrawsApiServiceSpy: DrawsApiServiceUseCase {

    var didCallGetDraws = false
    var getDrawsInjection: Draws?

    func getDraws() async throws -> Draws {
        didCallGetDraws = true
        return getDrawsInjection ?? Draws.init(draws: [.makeStub()])
    }
}
