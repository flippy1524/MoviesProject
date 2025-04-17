//
//  Utils+DateTime.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation
import MPUtils

extension Int {
    var formatToHoursAndMinutes: String {
        return formatMinutesToHoursAndMinutes(self)
    }
}

extension String {
    var formattedToDotDate: String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd.MM.yyyy"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let date = inputFormatter.date(from: self) {
            return outputFormatter.string(from: date)
        }
        return nil
    }
}

func formatMinutesToHoursAndMinutes(_ minutes: Int) -> String {
    let hours = minutes / 60
    let remainingMinutes = minutes % 60
    let hString = Localized.Default.hour
    let mString = Localized.Default.minute
    switch (hours, remainingMinutes) {
    case (0, let m):
        return "\(m) \(mString)"
    case (let h, 0):
        return "\(h) \(hString)"
    default:
        return "\(hours) \(hString) \(remainingMinutes) \(mString)"
    }
}
