//
//  MyTicketsApiService.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 14/08/2024.
//

import Foundation

final class MyTicketsApiService: MyTicketsApiServiceUseCase {

    private let urlSession: URLSession
    private let cache: DataCacher

    init(urlSession: URLSession = .shared, cache: DataCacher = .init()) {
        self.urlSession = urlSession
        self.cache = cache
    }

    func getMyTickets() async throws -> Tickets {
        guard let url = Endpoint.tickets.url else {
            throw ApiServiceError.faultyEndpoint
        }

        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
        let decoder = JSONDecoder()

        let ticketsData: Data

        do {
            let (data, response) = try await urlSession.data(for: request)
            cache.cacheData(request: request, data: data, response: response)
            ticketsData = data
        } catch {
            // Get the data from the cache if the user is offline
            guard let error = error as? URLError,
                  error.code == .notConnectedToInternet,
                  let data = cache.getCachedData(from: url) else {
                throw ApiServiceError.notConnectedToInternet
            }
            ticketsData = data
        }

        do {
            return try decoder.decode(Tickets.self, from: ticketsData)
        } catch {
            throw ApiServiceError.decodingError
        }
    }
}
