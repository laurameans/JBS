//
//  TimeInterval + Extensions.swift
//
//
//  Created by Justin Means on 2/9/23.
//

import Foundation

public extension TimeInterval {
    var descriptiveString: String {
        #if !os(Linux)
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 2

        return formatter.string(from: self) ?? ""
        #else
        let seconds = Int(self) % 60
        let minutes = (Int(self) / 60) % 60
        let hours = (Int(self) / 3600) % 24
        let days = Int(self) / 86400

        if days != 0 {
            return "\(days)d \(hours)h \(minutes)m \(seconds)s"
        } else if hours != 0 {
            return "\(hours)h \(minutes)m \(seconds)s"
        } else if minutes != 0 {
            return "\(minutes)m \(seconds)s"
        } else {
            return "\(seconds)s"
        }
        #endif
    }
}
