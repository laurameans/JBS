//
//  File.swift
//  
//
//  Created by Justin Means on 10/15/23.
//

import Foundation

public struct InferenceEnsemble: DTO {
    public init(id: UUID? = nil, title: String, models: [InferenceModel], subtitle: String? = nil, about: String? = nil, imageURLs: [String]? = nil, badges: [String]? = nil, properties: [String : String]? = nil, rank: InferenceEnsemble.Rank = .normal, curationApproved: Bool? = nil, systemApproved: Bool? = nil, adminApproved: Bool? = nil, creatorID: UUID? = nil) {
        self.id = id
        self.title = title
        self.models = models
        self.subtitle = subtitle
        self.about = about
        self.imageURLs = imageURLs
        self.badges = badges
        self.properties = properties
        self.rank = rank
        self.curationApproved = curationApproved
        self.systemApproved = systemApproved
        self.adminApproved = adminApproved
        self.creatorID = creatorID
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
    
    public enum Rank: Int, DTO {
        case low = 0
        case normal = 1
        case high = 2
    }
}
