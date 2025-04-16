//
//  Utils+DateTime.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation


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
    
    switch (hours, remainingMinutes) {
    case (0, let m):
        return "\(m) min"
    case (let h, 0):
        return "\(h) h"
    default:
        return "\(hours) h \(remainingMinutes) min"
    }
}
