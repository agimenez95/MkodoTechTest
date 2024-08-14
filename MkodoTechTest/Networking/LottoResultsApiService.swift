//
//  LottoResultsApiService.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

protocol LottoResultsApiService {
    func getLottoResults() async throws -> Draws
}

extension LottoResultsApiService {

    var dateFormat: String {
        "yyyy-MM-dd"
    }
}
