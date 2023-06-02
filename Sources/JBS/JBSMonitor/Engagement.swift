//
//  File.swift
//  
//
//  Created by Justin Means on 6/1/23.
//

import Foundation

public struct Engagement: Codable, Hashable, Equatable {
    public init(durationSeconds: Double, activity: Int, pulses: Int) {
        self.durationSeconds = durationSeconds
        self.activity = activity
        self.pulses = pulses
    }
    
    public var durationSeconds: Double
    public var activity: Int
    public var pulses: Int
    
    /// A higher value indicates the user is more active versus inactive
    public var ratioActive: Double {
        durationSeconds * (Double(activity) / Double(pulses))
    }
    
    public var activeSeconds: Double {
        durationSeconds * ratioActive
    }
}

public extension Engagement {
    static func +=(lhs: inout Engagement, rhs: Engagement) {
        lhs.durationSeconds += rhs.durationSeconds
        lhs.activity += rhs.activity
        lhs.pulses += rhs.pulses
    }
}
