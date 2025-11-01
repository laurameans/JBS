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
    public var signature: String
    public var sha256Hash: String
    public var sizeBytes: Int64
    public var bundleID: String
    public var platformTag: String
    public var downloadURL: String
    public var isPublished: Bool
    public var minMacOSVersion: String?
    public var isCritical: Bool
    public var channel: BinaryChannel
    public var createdDate: Date?
    public var updatedDate: Date?
}

public enum BinaryChannel: String, Codable, Sendable {
    case production
    case beta
    case dev
}
