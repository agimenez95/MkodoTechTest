//
//  StubDataMyTicketsApiService.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 13/08/2024.
//

import Foundation

final class StubDataMyTicketsApiService: MyTicketsApiService {

    private let bundle: Bundle
    private let fileName: String

    init(bundle: Bundle = .main, fileName: String = "StubMyTicketsData") {
        self.bundle = bundle
        self.fileName = fileName
    }

    func getMyTickets() async throws -> Tickets {
        guard let path =  bundle.path(forResource: fileName, ofType: "json") else {
            throw ApiServiceError.missingFileError
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(Tickets.self, from: data)
        } catch {
            throw ApiServiceError.decodingError
        }
    }
}
