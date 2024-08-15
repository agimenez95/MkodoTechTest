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

    var draws: [Draw]

    var allResultsViewModel: AllResultsViewModel {
        ResultsViewModelFactory.makeAllResultsViewModel(draws: draws, apiService: apiService)
    }

    var myTicketsViewModel: MyTicketsViewModel {
        MyTicketsViewModelFactory.makeMyTicketsViewModel(draws: draws)
    }

    let resultsImageName = Constant.resultsImageName
    let myTicketsImageName = Constant.myTicketsImageName
    let resultsTabName = Constant.resultsTabName
    let myTicketsTabName = Constant.myTicketsTabName

    var isErrorPresented = false
    var error: ApiServiceError?

    private let apiService: DrawsApiServiceUseCase

    init(draws: [Draw] = [], apiService: DrawsApiServiceUseCase = DrawsApiService()) {
        self.draws = draws
        self.apiService = apiService
        
    }

    func getDraws() async {
        do {
            draws = try await apiService.getDraws().draws
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
