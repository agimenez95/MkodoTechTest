//
//  ResultView.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import SwiftUI

struct ResultView: View {

    @State var viewModel: ResultViewModel

    var body: some View {
        VStack(spacing: 8) {
            OutcomeView(viewModel: viewModel.outcomeViewModel)
                .padding(.trailing)

            HStack {
                Text(viewModel.dateText)
                    .dateStyle()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ResultView(viewModel: .init(draw: .init(id: "1", 
                                            drawDate: .now,
                                            number1: "1",
                                            number2: "2",
                                            number3: "3",
                                            number4: "4",
                                            number5: "5",
                                            number6: "6",
                                            bonusBall: "10",
                                            topPrize: 1000)))
}
