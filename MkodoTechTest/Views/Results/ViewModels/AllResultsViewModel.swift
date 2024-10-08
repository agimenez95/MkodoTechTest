//
//  AllResultsViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Observation
import SwiftUI

@Observable
class AllResultsViewModel {

    let navigationTitle = Constant.lottoResults
    var isDataFetchNeeded = true
    var draws: [Draw]

    var isErrorPresented = false
    var error: ApiServiceError?

    private let drawsApiService: DrawsApiServiceUseCase

    init(draws: [Draw] = [],
         drawsApiService: DrawsApiServiceUseCase = DrawsApiService()) {
        self.draws = draws
        self.drawsApiService = drawsApiService

        isDataFetchNeeded = draws.isEmpty
    }

    func getData() async {
        do {
            let response = try await drawsApiService.getDraws()
            setResultsSorted(draws: response)
        } catch {
            self.error = error as? ApiServiceError
            isErrorPresented = true
        }
    }

    func makeResultViewModel(for draw: Draw) -> ResultViewModel {
        ResultsViewModelFactory.makeResultViewModel(for: draw)
    }

    func makeResultDetailViewModel(for draw: Draw) -> ResultDetailViewModel {
        ResultsViewModelFactory.makeResultDetailViewModel(for: draw)
    }
}

private extension AllResultsViewModel {

    enum Constant {
        static let lottoResults: LocalizedStringKey = "LOTTO_RESULTS"
    }

    func setResultsSorted(draws: Draws) {
        self.draws = draws.draws.sorted { $0.drawDate > $1.drawDate }
    }
}
