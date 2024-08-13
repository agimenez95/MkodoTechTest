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
                ForEach(viewModel.sections, id: \.self) { sectionName in
                    Section("\(sectionName)") {
                        ForEach(viewModel.tickets(in: sectionName), id: \.id) { ticket in
                            OutcomeView(viewModel: viewModel.makeOutcomeViewModel(for: ticket))
                        }
                    }
                }
            }
            .navigationTitle("My Tickets")
        }
        .task {
            do {
                try await viewModel.getTickets()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    MyTicketsView(viewModel: .init(draws: [.init(id: "draw-1",
                                                 drawDate: .now,
                                                 number1: "1",
                                                 number2: "2",
                                                 number3: "3",
                                                 number4: "4",
                                                 number5: "5",
                                                 number6: "6",
                                                 bonusBall: "10",
                                                 topPrize: 10_000)]))
}
