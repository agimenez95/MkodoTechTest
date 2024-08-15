//
//  ResultsViewModelFactory.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 14/08/2024.
//

import Foundation

struct ResultsViewModelFactory {
    
    static func makeAllResultsViewModel(draws: [Draw] = [],
                                        apiService: DrawsApiServiceUseCase = DrawsApiService()) -> AllResultsViewModel {
        AllResultsViewModel(draws: draws, drawsApiService: apiService)
    }

    static func makeResultViewModel(for draw: Draw) -> ResultViewModel {
        ResultViewModel(draw: draw)
    }

    static func makeResultDetailViewModel(for draw: Draw) -> ResultDetailViewModel {
        ResultDetailViewModel(draw: draw)
    }
}
