//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebContent: DTO {
    public let id: UUID
    public var type: ContentType
    public var value: String
    public var enabled: Bool = true
    
    public enum ContentType: String, DTO {
        case text
        case image
    }
}


