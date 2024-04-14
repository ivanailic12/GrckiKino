//
//  Helper.swift
//  GrckiKino
//
//  Created by Ivana on 11.4.24..
//

import SwiftUI

public extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}

struct Helper {
    public enum TimeFormat {
        case hourMinute
        case hourMinuteSecond
    }
    
    static func formatTime(timestamp: TimeInterval, format: TimeFormat) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        switch format {
        case .hourMinute:
            dateFormatter.dateFormat = "HH:mm"
        case .hourMinuteSecond:
            dateFormatter.dateFormat = "HH:mm:ss"
        }
        return dateFormatter.string(from: date)
    }
}
