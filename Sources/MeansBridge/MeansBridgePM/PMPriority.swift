//
//  File.swift
//  
//
//  Created by Justin Means on 10/21/23.
//

import Foundation

public enum PMPriority: String, DTO {
    case low
    case medium
    case high
    case urgent
    case none
    
    public var title: String {
        switch self {
                
            case .low:
                return "Low"
            case .medium:
                return "Medium"
            case .high:
                return "High"
            case .urgent:
                return "Urgent"
            case .none:
                return "None"
        }
    }
}
