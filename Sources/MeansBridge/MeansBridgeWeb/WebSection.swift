//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebSection: DTO, Duplicatable {
    public var id: UUID
    public var rows: [WebRow]
    public var enabled: Bool = true
    public var type: SectionType? = .standard
    
    public enum SectionType: DTO {
        case standard
        case fullWidth
        case fullWidthAndHeight
    }
}
