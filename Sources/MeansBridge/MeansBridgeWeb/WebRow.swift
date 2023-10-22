//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebRow: DTO {
    public let id: UUID
    public var contents: [WebContent]
    public var enabled: Bool = true
}
