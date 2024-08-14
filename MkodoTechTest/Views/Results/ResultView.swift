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
        VStack(spacing: Constant.spacing) {
            OutcomeView(viewModel: viewModel.outcomeViewModel)
                .padding(.trailing)

            HStack {
                Text(viewModel.date, style: .date)
                    .dateStyle()
                
                Spacer()
            }
        }
    }
}

private extension ResultView {

    enum Constant {
        static let spacing: CGFloat = 8
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
                                            topPrize: 10_000)))
}
