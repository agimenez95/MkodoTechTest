//
//  MainViewModel.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Observation
import SwiftUI

@Observable
final class MainViewModel {

    var results: [Draw]

    var allResultsViewModel: AllResultsViewModel {
        ResultsViewModelFactory.makeAllResultsViewModel(results: results, apiService: apiService)
    }

    var myTicketsViewModel: MyTicketsViewModel {
        MyTicketsViewModelFactory.makeMyTicketsViewModel(draws: results)
    }

    let resultsImageName = Constant.resultsImageName
    let myTicketsImageName = Constant.myTicketsImageName
    let resultsTabName = Constant.resultsTabName
    let myTicketsTabName = Constant.myTicketsTabName

    var isErrorPresented = false
    var error: ApiServiceError?

    private let apiService: LottoResultsApiService

    init(results: [Draw] = [], apiService: LottoResultsApiService = StubDataLottoResultsApiService()) {
        self.results = results
        self.apiService = apiService
    }

    func getResults() async {
        do {
            results = try await apiService.getLottoResults().draws
        } catch {
            self.error = error as? ApiServiceError
            isErrorPresented = true
        }
    }
}

private extension MainViewModel {

    enum Constant {
        static let resultsImageName = "list.dash"
        static let myTicketsImageName = "ticket.fill"
        static let resultsTabName: LocalizedStringKey = "RESULTS"
        static let myTicketsTabName: LocalizedStringKey = "MY_TICKETS"
    }
}
