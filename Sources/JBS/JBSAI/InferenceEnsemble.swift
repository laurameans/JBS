//
//  InferenceEnsemble.swift
//
//
//  Created by Justin Means on 10/15/23.
//

import Foundation

@PublicInit
public struct InferenceEnsemble: DTO {
    public enum Rank: Int, DTO {
        case low = 0
        case normal = 1
        case high = 2
    }

    public var id: UUID?
    public var title: String
    public var models: [InferenceModel]
    public var subtitle: String?
    public var about: String?
    public var imageURLs: [String]?
    public var badges: [String]?
    public var properties: [String: String]?
    public var rank: Rank = .normal
    public var curationApproved: Bool?
    public var systemApproved: Bool?
    public var adminApproved: Bool?
    public var creatorID: UUID?

    public var bytes: Int {
        models.map { $0.bytes }.reduce(0, +)
    }
}
