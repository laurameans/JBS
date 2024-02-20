//
//  WebColumn.swift
//
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebColumn: DTO, Duplicatable {
    public var id: UUID
    public var contents: [WebContent]
}
