//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebRow: DTO, Duplicatable {
    public var id: UUID
    public var columns: [WebColumn]
    public var enabled: Bool = true
}
