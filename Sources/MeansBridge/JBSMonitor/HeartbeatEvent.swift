//
//  File.swift
//  
//
//  Created by Justin Means on 6/1/23.
//

import Foundation

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
    
    var e: String {
        switch self {
            case .event(let event):
                let e = event.value as? HeartbeatEvent
            default: break
        }
        return ""
    }
}

public protocol EventRepresentable: Codable, Equatable, Sendable {
    
}
