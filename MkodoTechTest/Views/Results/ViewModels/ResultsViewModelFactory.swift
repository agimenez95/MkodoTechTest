//
//  ResultsViewModelFactory.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 14/08/2024.
//

import Foundation

struct ResultsViewModelFactory {
    
    static func makeAllResultsViewModel(results: [Draw] = [],
                                        apiService: LottoResultsApiService = StubDataLottoResultsApiService()) -> AllResultsViewModel {
        AllResultsViewModel(lottoResults: results, lottoResultsApiService: apiService)
    }

    static func makeResultViewModel(for draw: Draw) -> ResultViewModel {
        ResultViewModel(draw: draw)
    }

    static func makeResultDetailViewModel(for draw: Draw) -> ResultDetailViewModel {
        ResultDetailViewModel(draw: draw)
    }
}
