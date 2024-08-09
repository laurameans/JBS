//
//  Engagement.swift
//
//
//  Created by Justin Means on 6/1/23.
//

import Foundation

@PublicInit
public struct Engagement: DTO {
    public var durationSeconds: Double
    public var activity: Int
    public var pulses: Int

    /// A higher value indicates the user is more active versus inactive
    public var ratioActive: Double {
        Double(activity) / Double(pulses)
    }

    public var activeSeconds: Double {
        durationSeconds * ratioActive
    }
}

public extension Engagement {
    static func += (lhs: inout Engagement, rhs: Engagement) {
        lhs.durationSeconds += rhs.durationSeconds
        lhs.activity += rhs.activity
        lhs.pulses += rhs.pulses
    }

    static func + (lhs: Engagement, rhs: Engagement) -> Engagement {
        let durationSeconds = lhs.durationSeconds + rhs.durationSeconds
        let activity = lhs.activity + rhs.activity
        let pulses = lhs.pulses + rhs.pulses
        return Engagement(durationSeconds: durationSeconds, activity: activity, pulses: pulses)
    }

    static func - (lhs: Engagement, rhs: Engagement) -> Engagement {
        let durationSeconds = lhs.durationSeconds - rhs.durationSeconds
        let activity = lhs.activity - rhs.activity
        let pulses = lhs.pulses - rhs.pulses
        return Engagement(durationSeconds: durationSeconds, activity: activity, pulses: pulses)
    }

    static func * (lhs: Engagement, rhs: Double) -> Engagement {
        let durationSeconds = lhs.durationSeconds * rhs
        let activity = Int(Double(lhs.activity) * rhs)
        let pulses = Int(Double(lhs.pulses) * rhs)
        return Engagement(durationSeconds: durationSeconds, activity: activity, pulses: pulses)
    }

    static func / (lhs: Engagement, rhs: Double) -> Engagement {
        let durationSeconds = lhs.durationSeconds / rhs
        let activity = Int(Double(lhs.activity) / rhs)
        let pulses = Int(Double(lhs.pulses) / rhs)
        return Engagement(durationSeconds: durationSeconds, activity: activity, pulses: pulses)
    }

    static func -= (lhs: inout Engagement, rhs: Engagement) {
        lhs.durationSeconds -= rhs.durationSeconds
        lhs.activity -= rhs.activity
        lhs.pulses -= rhs.pulses
    }

    static func *= (lhs: inout Engagement, rhs: Double) {
        lhs.durationSeconds *= rhs
        lhs.activity = Int(Double(lhs.activity) * rhs)
        lhs.pulses = Int(Double(lhs.pulses) * rhs)
    }

    static func /= (lhs: inout Engagement, rhs: Double) {
        lhs.durationSeconds /= rhs
        lhs.activity = Int(Double(lhs.activity) / rhs)
        lhs.pulses = Int(Double(lhs.pulses) / rhs)
    }
}
