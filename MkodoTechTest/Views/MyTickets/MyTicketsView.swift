//
//  MyTicketsView.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import SwiftUI

struct MyTicketsView: View {
    
    @State var viewModel: MyTicketsViewModel

    var body: some View {
        NavigationStack {
            Form {
                ForEach(viewModel.sections, id: \.self) { sectionType in
                    Section {
                        ForEach(viewModel.tickets(in: sectionType)) { ticket in
                            OutcomeView(viewModel: viewModel.makeOutcomeViewModel(for: ticket))
                        }
                    } header: {
                        makeSectionTitle(for: sectionType)
                    }
                }
            }
            .navigationTitle(viewModel.navigationTitle)
        }
        .task {
            await viewModel.getTickets()
        }
        .alert(isPresented: $viewModel.isErrorPresented) {
            Alert(title: Text(viewModel.error?.description ?? "Error"))
        }
    }
}

private extension MyTicketsView {

    func makeSectionTitle(for sectionType: DateSection) -> Text {
        switch sectionType {
        case .upcoming: Text(viewModel.upcomingSectionTitle)
        case .date(let date): Text(date, style: .date)
        }
    }
}

#Preview {
    MyTicketsView(viewModel: .init(draws: [.init(id: "draw-1",
                                                 drawDate: .now,
                                                 number1: "2",
                                                 number2: "2",
                                                 number3: "5",
                                                 number4: "4",
                                                 number5: "47",
                                                 number6: "6",
                                                 bonusBall: "1",
                                                 topPrize: 10_000)]))
}
