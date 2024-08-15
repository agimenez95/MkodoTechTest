//
//  DrawsApiService.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 14/08/2024.
//

import Foundation

final class DrawsApiService: DrawsApiServiceUseCase {

    private let urlSession: URLSession
    private let cache: DataCacher

    init(urlSession: URLSession = .shared, cache: DataCacher = .init()) {
        self.urlSession = urlSession
        self.cache = cache
    }

    func getDraws() async throws -> Draws {
        guard let url = Endpoint.draws.url else {
            throw ApiServiceError.faultyEndpoint
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
        let drawsData: Data
        
        do {
            let (data, response) = try await urlSession.data(for: request)
            cache.cacheData(request: request, data: data, response: response)
            drawsData = data
        } catch {
            // Get the data from the cache if the user is offline
            guard let error = error as? URLError,
                  error.code == .notConnectedToInternet,
                  let data = cache.getCachedData(from: url) else {
                throw ApiServiceError.notConnectedToInternet
            }
            drawsData = data
        }

        do {
            return try decoder.decode(Draws.self, from: drawsData)
        } catch {
            throw ApiServiceError.decodingError
        }
    }
}
