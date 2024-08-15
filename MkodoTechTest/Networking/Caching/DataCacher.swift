//
//  DataCacher.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 15/08/2024.
//

import Foundation

final class DataCacher {

    private let urlCache: URLCache

    init(urlCache: URLCache = .shared) {
        self.urlCache = urlCache
    }

    func cacheData(request: URLRequest, data: Data, response: URLResponse) {
        let cachedResponse = CachedURLResponse(response: response, data: data)
        urlCache.storeCachedResponse(cachedResponse, for: request)
    }

    func getCachedData(from url: URL) -> Data? {
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataDontLoad)
        return urlCache.cachedResponse(for: request)?.data
    }
}
