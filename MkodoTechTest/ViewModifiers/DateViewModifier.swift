//
//  DateViewModifier.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import SwiftUI

struct DateText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundStyle(.gray)
    }
}

extension View {
    func dateStyle() -> some View {
        modifier(DateText())
    }
}
