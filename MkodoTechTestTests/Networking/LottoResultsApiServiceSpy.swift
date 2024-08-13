//
//  LottoResultsApiServiceSpy.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation
@testable import MkodoTechTest

final class LottoResultsApiServiceSpy: LottoResultsApiService {

    var didCallGetLottoResults = false
    var getLottoResultsInjection: Draws?

    func getLottoResults() async throws -> Draws {
        didCallGetLottoResults = true
        return getLottoResultsInjection ?? Draws.init(draws: [.makeStub()])
    }
}
