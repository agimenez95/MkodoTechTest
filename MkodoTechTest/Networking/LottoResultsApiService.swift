//
//  LottoResultsApiService.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

protocol LottoResultsApiService: AnyObject {
    func getLottoResults() async throws -> Draws
}
