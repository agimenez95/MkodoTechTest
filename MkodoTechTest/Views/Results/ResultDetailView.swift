//
//  ResultDetailView.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import SwiftUI

struct ResultDetailView: View {

    @State var viewModel: ResultDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.prizeAmount)
                .prizeTitleStyle()
                .padding()
            Text(viewModel.dateText)
                .dateStyle()

            Spacer()

            OutcomeView(viewModel: viewModel.outcomeViewModel)
                .padding()

            Spacer()
        }
    }
}

#Preview {
    ResultDetailView(viewModel: ResultDetailViewModel(draw: Draw(id: "1",
                                                                 drawDate: .now,
                                                                 number1: "1",
                                                                 number2: "2",
                                                                 number3: "3",
                                                                 number4: "4",
                                                                 number5: "5",
                                                                 number6: "6",
                                                                 bonusBall: "10",
                                                                 topPrize: 100000)))
}
