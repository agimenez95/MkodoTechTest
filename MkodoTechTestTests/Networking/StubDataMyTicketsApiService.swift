//
//  StubDataMyTicketsApiService.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 15/08/2024.
//

import Foundation
@testable import MkodoTechTest

final class StubDataMyTicketsApiService: MyTicketsApiServiceUseCase {

    private let fileName: String
    private let bundle: Bundle

    init(fileName: String = "StubMyTicketsData") {
        self.fileName = fileName
        self.bundle = Bundle(for: type(of: self))
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
