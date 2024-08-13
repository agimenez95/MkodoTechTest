//
//  Matches.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation

enum Matches {
    case yes
    case no
    case notDrawn

    static func match(lhs: String, rhs: String) -> Matches {
        lhs == rhs ? .yes : .no
    }
}
