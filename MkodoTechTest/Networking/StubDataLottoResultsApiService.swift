//
//  StubDataLottoResultsApiService.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

final class StubDataLottoResultsApiService: LottoResultsApiService {

    private let bundle: Bundle
    private let fileName: String

    init(bundle: Bundle = .main, fileName: String = "StubLottoResultsData") {
        self.bundle = bundle
        self.fileName = fileName
    }

    func getLottoResults() async throws -> Draws {
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
            print(error)
            throw ApiServiceError.decodingError
        }
    }
}
