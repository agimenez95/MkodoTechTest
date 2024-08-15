//
//  Endpoint.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 15/08/2024.
//

import Foundation

enum Endpoint: String {
    case draws = "StubLottoResultsData.json"
    case tickets = "StubMyTicketsData.json"

    var url: URL? {
        let domain = "https://agimenez95.github.io/LottoDrawsJSON/"
        return URL(string: "\(domain)\(self.rawValue)")
    }
}
