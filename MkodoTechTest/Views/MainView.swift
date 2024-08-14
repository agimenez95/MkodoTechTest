//
//  MainView.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import SwiftUI

struct MainView: View {

    @State var viewModel = MainViewModel()

    var body: some View {
        TabView {
            AllResultsView(viewModel: viewModel.allResultsViewModel)
                .tabItem {
                    Label(viewModel.resultsTabName, systemImage: viewModel.resultsImageName)
                }

            MyTicketsView(viewModel: viewModel.myTicketsViewModel)
                .tabItem {
                    Label(viewModel.myTicketsTabName, systemImage: viewModel.myTicketsImageName)
                }
        }
        .task {
            await viewModel.getResults()
        }
        .alert(isPresented: $viewModel.isErrorPresented) {
            Alert(title: Text(viewModel.error?.description ?? "Error"))
        }
    }
}

#Preview {
    MainView()
}
