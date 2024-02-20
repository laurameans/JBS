//
//  Binary.swift
//
//
//  Created by Justin Means on 1/23/23.
//

import Foundation

@PublicInit
public struct Binary: Codable, Hashable, Equatable, Sendable {
    public var id: UUID?
    public var zipURL: String
    public var version: String
    public var releaseNotes: String
    public var releaseDescription: String
    public var createdDate: Date?
    public var updatedDate: Date?
}
