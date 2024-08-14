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
            List(viewModel.lottoResults) { draw in
                NavigationLink {
                    ResultDetailView(viewModel: viewModel.makeResultDetailViewModel(for: draw))
                } label: {
                    ResultView(viewModel: viewModel.makeResultViewModel(for: draw))
                }
            }
            .navigationTitle(viewModel.navigationTitle)
        }
        .task {
            guard viewModel.isDataFetchNeeded else { return }
            await viewModel.getData()
        }
        .alert(isPresented: $viewModel.isErrorPresented) {
            Alert(title: Text(viewModel.error?.description ?? "Error"))
        }
    }
}

#Preview {
    AllResultsView(viewModel: .init())
}
