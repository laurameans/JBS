//
//  HeartbeatEvent.swift
//
//
//  Created by Justin Means on 6/1/23.
//

import Foundation

// MARK: - HeartbeatEvent

public enum HeartbeatEvent: Codable, Equatable {
    case activity
    case pulse
    case authenticate(token: String)
    case error(message: String)
    case connected
    case memoryWarning
    case event(_ event: JSONAny)

    public func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

// MARK: - EventRepresentable

public protocol EventRepresentable: Codable, Equatable, Sendable {}
