//
//  DrawsApiServiceUseCase.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

protocol DrawsApiServiceUseCase {
    func getDraws() async throws -> Draws
}

extension DrawsApiServiceUseCase {

    var dateFormat: String {
        "yyyy-MM-dd"
    }
}
