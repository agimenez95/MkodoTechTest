//
//  ApiServiceError.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

enum ApiServiceError: Error {
    case faultyEndpoint
    case decodingError
    case missingFileError
    case notConnectedToInternet

    var description: String {
        switch self {
        case .faultyEndpoint:
            "There is a problem with the endpoint."
        case .decodingError:
            "There is a problem decoding the file."
        case .missingFileError:
            "The file is missing."
        case .notConnectedToInternet:
            "You are not connected to the internet."
        }
    }
}
