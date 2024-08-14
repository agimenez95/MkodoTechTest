//
//  OutcomeView.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import SwiftUI

struct OutcomeView: View {

    @State var viewModel: OutcomeViewModel

    var body: some View {
        HStack(spacing: Constant.spacing) {
            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber1),
                                              number: viewModel.number1))
            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber2),
                                              number: viewModel.number2))
            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber3),
                                              number: viewModel.number3))
            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber4),
                                              number: viewModel.number4))
            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber5),
                                              number: viewModel.number5))
            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber6),
                                              number: viewModel.number6))
            BallView(viewModel: BallViewModel(ballState: .bonusBall(matches: viewModel.matchesBonusBall),
                                              number: viewModel.bonusBall))
        }
    }
}

private extension OutcomeView {

    enum Constant {
        static let spacing: CGFloat = 8
    }
}

#Preview("not drawn") {
    OutcomeView(viewModel: OutcomeViewModel(number1: "1",
                                            number2: "2",
                                            number3: "3",
                                            number4: "4",
                                            number5: "5",
                                            number6: "6",
                                            bonusBall: "10"))
}
#Preview("all mismatch") {
    OutcomeView(viewModel: OutcomeViewModel(number1: "1",
                                            number2: "2",
                                            number3: "3",
                                            number4: "4",
                                            number5: "5",
                                            number6: "6",
                                            bonusBall: "10",
                                            matchesNumber1: .no,
                                            matchesNumber2: .no,
                                            matchesNumber3: .no,
                                            matchesNumber4: .no,
                                            matchesNumber5: .no,
                                            matchesNumber6: .no,
                                            matchesBonusBall: .no))
}

#Preview("all match") {
    OutcomeView(viewModel: OutcomeViewModel(number1: "1",
                                            number2: "2",
                                            number3: "3",
                                            number4: "4",
                                            number5: "5",
                                            number6: "6",
                                            bonusBall: "10",
                                            matchesNumber1: .yes,
                                            matchesNumber2: .yes,
                                            matchesNumber3: .yes,
                                            matchesNumber4: .yes,
                                            matchesNumber5: .yes,
                                            matchesNumber6: .yes,
                                            matchesBonusBall: .yes))
}
