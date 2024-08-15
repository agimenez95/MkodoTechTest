//
//  StubDrawsApiService.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 15/08/2024.
//

import Foundation
@testable import MkodoTechTest

final class StubDrawsApiService: DrawsApiServiceUseCase {

    private let fileName: String
    private let bundle: Bundle

    init(fileName: String = "StubLottoResultsData") {
        self.fileName = fileName
        self.bundle = Bundle(for: type(of: self))
    }

    func getDraws() async throws -> Draws {
        guard let path =  bundle.path(forResource: fileName, ofType: "json") else {
            throw ApiServiceError.missingFileError
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try decoder.decode(Draws.self, from: data)
        } catch {
            throw ApiServiceError.decodingError
        }
    }
}
