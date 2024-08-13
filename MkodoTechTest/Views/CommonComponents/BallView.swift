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
            .stroke(viewModel.borderColor.gradient, lineWidth: 4)
            .overlay(
                Text(viewModel.number)
                    .font(.system(size: 20, weight: .bold))
                    .minimumScaleFactor(0.2)
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .padding(6)
            )
    }
}

#Preview {
    Group {
        BallView(viewModel: .init(number: "100"))
        BallView(viewModel: .init(ballState: .bonusBall(matches: .notDrawn), number: "100"))
    }
}
