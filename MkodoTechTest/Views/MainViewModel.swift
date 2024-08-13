//
//  MainViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation
import Observation

@Observable
final class MainViewModel {

    var results: [Draw]

    var allResultsViewModel: AllResultsViewModel {
        AllResultsViewModel(lottoResults: results, lottoResultsApiService: apiService)
    }

    var myTicketsViewModel: MyTicketsViewModel {
        MyTicketsViewModel(draws: results)
    }

    private let apiService: LottoResultsApiService

    init(results: [Draw] = [], apiService: LottoResultsApiService = StubDataLottoResultsApiService()) {
        self.results = results
        self.apiService = apiService
    }

    func getResults() async {
        do {
            results = try await apiService.getLottoResults().draws
        } catch {
            // TODO: show chached results
            print(error)
        }
    }
}
