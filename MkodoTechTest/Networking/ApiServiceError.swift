//
//  ApiServiceError.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

enum ApiServiceError: Error {
    case decodingError
    case missingFileError

    var description: String {
        switch self {
        case .decodingError:
            "There is a problem decoding the file"
        case .missingFileError:
            "The file is missing"
        }
    }
}
