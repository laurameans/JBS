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
    
    public func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
