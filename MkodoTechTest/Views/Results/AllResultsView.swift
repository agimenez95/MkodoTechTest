//
//  AllResultsView.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import SwiftUI

struct AllResultsView: View {

    @State var viewModel: AllResultsViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.lottoResults, id: \.id) { draw in
                NavigationLink {
                    ResultDetailView(viewModel: viewModel.makeResultDetailViewModel(for: draw))
                } label: {
                    ResultView(viewModel: ResultViewModel(draw: draw))
                }
            }
            .navigationTitle("Lotto Results")
        }
        .task {
            guard viewModel.isDataFetchNeeded else { return }

            do {
                try await viewModel.getData()
            }
            catch {
                print(error)
            }
        }
    }
}

#Preview {
    AllResultsView(viewModel: .init())
}
