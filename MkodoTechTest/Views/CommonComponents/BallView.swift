//
//  BallView.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import SwiftUI

struct BallView: View {

    @State var viewModel: BallViewModel

    var body: some View {
        Circle()
            .fill(viewModel.backgroundColor.gradient)
            .stroke(viewModel.borderColor.gradient, lineWidth: Constant.borderLineWidth)
            .overlay(
                Text(viewModel.number)
                    .font(Constant.font)
                    .minimumScaleFactor(Constant.minimumScaleFactor)
                    .lineLimit(Constant.lineLimit)
                    .foregroundColor(.black)
                    .padding(Constant.padding)
            )
    }
}

private extension BallView {

    enum Constant {
        static let borderLineWidth: CGFloat = 4
        static let font: Font = .system(size: 20, weight: .bold)
        static let minimumScaleFactor: CGFloat = 0.2
        static let lineLimit = 1
        static let padding: CGFloat = 6
    }
}

#Preview("not drawn") {
    Group {
        BallView(viewModel: .init(number: "100"))
        BallView(viewModel: .init(ballState: .bonusBall(matches: .notDrawn), number: "100"))
    }
}

#Preview("matches") {
    Group {
        BallView(viewModel: .init(ballState: .normal(matches: .yes),
                                  number: "100"))
        BallView(viewModel: .init(ballState: .bonusBall(matches: .yes),
                                  number: "100"))
    }
}

#Preview("mismatch") {
    Group {
        BallView(viewModel: .init(ballState: .normal(matches: .no),
                                  number: "100"))
        BallView(viewModel: .init(ballState: .bonusBall(matches: .no),
                                  number: "100"))
    }
}
