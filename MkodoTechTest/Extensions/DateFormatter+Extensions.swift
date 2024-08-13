//
//  DateFormatter+Extensions.swift
//  MkodoTechTest
//
//  Created by Adriano Gimenez on 12/08/2024.
//

import Foundation

extension DateFormatter {

    func getCustomDate(from string: String) -> Date? {
        dateFormat = "yyyy-MM-dd"
        return date(from: string)
    }

    func makeFormattedDateString(from date: Date?) -> String? {
        guard let date else {
            return nil
        }

        dateFormat = "dd/MM/yyyy"
        return string(from: date)
    }
}
