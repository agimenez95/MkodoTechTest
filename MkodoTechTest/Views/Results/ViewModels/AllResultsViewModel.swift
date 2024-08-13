//
//  AllResultsViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation
import Observation

@Observable
class AllResultsViewModel {

    var isDataFetchNeeded = true
    var lottoResults: [Draw]
    var lottoResultsApiService: LottoResultsApiService

    init(lottoResults: [Draw] = [],
         lottoResultsApiService: LottoResultsApiService = StubDataLottoResultsApiService()) {
        self.lottoResults = lottoResults
        self.lottoResultsApiService = lottoResultsApiService

        isDataFetchNeeded = lottoResults.isEmpty
    }

    func getData() async throws {
        let response = try await lottoResultsApiService.getLottoResults()
        setResultsSorted(draws: response)
    }

    func makeResultDetailViewModel(for draw: Draw) -> ResultDetailViewModel {
        ResultDetailViewModel(draw: draw)
    }
}

private extension AllResultsViewModel {

    func setResultsSorted(draws: Draws) {
        lottoResults = draws.draws.sorted(by: { lhs, rhs in
            guard let lhsDate = lhs.drawDate,
                  let rhsDate = rhs.drawDate else {
                return false
            }
            return lhsDate > rhsDate
        })
    }
}
