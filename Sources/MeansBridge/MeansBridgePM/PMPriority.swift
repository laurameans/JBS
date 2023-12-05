//
//  File.swift
//  
//
//  Created by Justin Means on 10/21/23.
//

import Foundation

public enum PMPriority: Int, DTO {
    case low = 1
    case medium = 2
    case high = 3
    case urgent = 4
    case none = 0
    
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
