//
//  Utils+DateTime.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation

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
