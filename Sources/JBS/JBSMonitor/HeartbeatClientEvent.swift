//
//  HeartbeatEvent.swift
//
//
//  Created by Justin Means on 6/1/23.
//

import Foundation

public enum HeartbeatClientEvent: DTO {
    case activity
    case pulse
    case authenticate(token: String)
    case error(message: String)
    case connect
    case memoryWarning
    case event(_ data: Data)

    public func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

public enum HeartbeatServerEvent: DTO {
    case error(message: String)
    case connected
    case state(_ state: State)
    case event(_ data: Data)
    
    public enum State: DTO {
        case operational
        case degraded(_ message: String)
        case outage(_ message: String)
    }
    
    public func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

public protocol EventRepresentable: Codable, Equatable, Sendable {}
