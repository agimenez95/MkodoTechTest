//
//  OutcomeView.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import SwiftUI

struct OutcomeView: View {

    @State var viewModel: OutcomeViewModel

    @State private var bouncingBall: AnimatingBall = .none
    @State private var bounceHeight: CGFloat = 0

    var body: some View {
        HStack(spacing: Constant.spacing) {
            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber1),
                                              number: viewModel.number1))
            .offset(CGSize(width: 0, height: bouncingBall == .ball1 ? bounceHeight : 0))

            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber2),
                                              number: viewModel.number2))
            .offset(CGSize(width: 0, height: bouncingBall == .ball2 ? bounceHeight : 0))

            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber3),
                                              number: viewModel.number3))
            .offset(CGSize(width: 0, height: bouncingBall == .ball3 ? bounceHeight : 0))

            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber4),
                                              number: viewModel.number4))
            .offset(CGSize(width: 0, height: bouncingBall == .ball4 ? bounceHeight : 0))

            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber5),
                                              number: viewModel.number5))
            .offset(CGSize(width: 0, height: bouncingBall == .ball5 ? bounceHeight : 0))

            BallView(viewModel: BallViewModel(ballState: .normal(matches: viewModel.matchesNumber6),
                                              number: viewModel.number6))
            .offset(CGSize(width: 0, height: bouncingBall == .ball6 ? bounceHeight : 0))

            BallView(viewModel: BallViewModel(ballState: .bonusBall(matches: viewModel.matchesBonusBall),
                                              number: viewModel.bonusBall))
            .offset(CGSize(width: 0, height: bouncingBall == .bonusBall ? bounceHeight : 0))
        }
        .padding([.leading, .trailing], Constant.padding)
        .task {
            guard !viewModel.isAnimating else { return }
            bouncingBall = viewModel.shouldAnimate ? .ball1 : .none
            bounceAnimation()
        }
    }
}

private extension OutcomeView {

    enum Constant {
        static let padding: CGFloat = 4
        static let spacing: CGFloat = 8
        static let bounceDuration: CGFloat = 8
        static let bounceHeight: CGFloat = -60
        static let animationDuration: TimeInterval = 0.2
    }

    @MainActor
    func bounceAnimation() {
        viewModel.isAnimating = bouncingBall != .none

        withAnimation(.easeOut(duration: Constant.animationDuration)) {
            bounceHeight = Constant.bounceHeight
        }

        withAnimation(.easeIn(duration: Constant.animationDuration).delay(Constant.animationDuration)) {
            bounceHeight = .zero
        } completion: {
            bouncingBall = bouncingBall.next
            viewModel.isAnimating = bouncingBall != .none

            if bouncingBall != .none {
                bounceAnimation()
            }
        }
    }
}

#Preview("bounce animation") {
    OutcomeView(viewModel: OutcomeViewModel(number1: "1",
                                            number2: "2",
                                            number3: "3",
                                            number4: "4",
                                            number5: "5",
                                            number6: "6",
                                            bonusBall: "10",
                                            shouldAnimate: true))
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
