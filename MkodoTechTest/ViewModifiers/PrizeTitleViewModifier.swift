//
//  PrizeTitleViewModifier.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import SwiftUI

struct PrizeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, weight: .bold))
            .foregroundStyle(.primary)
    }
}

extension View {
    func prizeTitleStyle() -> some View {
        modifier(PrizeTitle())
    }
}
