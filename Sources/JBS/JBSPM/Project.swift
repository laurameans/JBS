//
//  Project.swift
//  JBS
//
//  Created by Justin Means on 1/27/25.
//

import Foundation

// MARK: - PMProject
@PublicInit
public struct PMProject: Hashable, Sendable {
    public var id: String
    public var totalMembers: Int
    public var totalCycles: Int
    public var totalModules: Int
    public var isMember: Bool
    public var memberRole: Int
    public var isDeployed: Bool
    public var coverImageURL: String
    public var inboxView: Bool
    public var createdAt: String
    public var updatedAt: String
    public var name: String
    public var description: String
    public var network: Int
    public var identifier: String
    public var moduleView: Bool
    public var cycleView: Bool
    public var issueViewsView: Bool
    public var pageView: Bool
    public var intakeView: Bool
    public var isTimeTrackingEnabled: Bool
    public var isIssueTypeEnabled: Bool
    public var guestViewAllFeatures: Bool
    public var coverImage: String
    public var archiveIn: Int
    public var closeIn: Int
    public var logoProps: PMLogoProps
    public var timezone: String
    public var createdBy: String
    public var updatedBy: String
    public var workspace: String
}

// MARK: - PMLogoProps
public struct PMLogoProps: Hashable, Sendable {
    public var icon: PMIcon
    public var inUse: String
    
    public init(icon: PMIcon, inUse: String) {
        self.icon = icon
        self.inUse = inUse
    }
}

// MARK: - PMIcon
public struct PMIcon: Hashable, Sendable {
    public var name: String
    public var color: String
    
    public init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

// MARK: - PMProjectsResponse
public struct PMProjectsResponse: Hashable, Sendable {
    public var groupedBy: NSNull
    public var subGroupedBy: NSNull
    public var totalCount: Int
    public var nextCursor: String
    public var prevCursor: String
    public var nextPageResults: Bool
    public var prevPageResults: Bool
    public var count: Int
    public var totalPages: Int
    public var totalResults: Int
    public var extraStats: NSNull
    public var results: [PMProjectsResult]
    
    public init(groupedBy: NSNull, subGroupedBy: NSNull, totalCount: Int, nextCursor: String, prevCursor: String, nextPageResults: Bool, prevPageResults: Bool, count: Int, totalPages: Int, totalResults: Int, extraStats: NSNull, results: [PMProjectsResult]) {
        self.groupedBy = groupedBy
        self.subGroupedBy = subGroupedBy
        self.totalCount = totalCount
        self.nextCursor = nextCursor
        self.prevCursor = prevCursor
        self.nextPageResults = nextPageResults
        self.prevPageResults = prevPageResults
        self.count = count
        self.totalPages = totalPages
        self.totalResults = totalResults
        self.extraStats = extraStats
        self.results = results
    }
}

// MARK: - PMResult
@PublicInit
public struct PMProjectsResult: Hashable, Sendable {
    public var id: String
    public var totalMembers: Int
    public var totalCycles: Int
    public var totalModules: Int
    public var isMember: Bool
    public var sortOrder: Int
    public var memberRole: Int
    public var isDeployed: Bool
    public var coverImageURL: String
    public var inboxView: Bool
    public var createdAt: String
    public var updatedAt: String
    public var name: String
    public var description: String
    public var network: Int
    public var identifier: String
    public var moduleView: Bool
    public var cycleView: Bool
    public var issueViewsView: Bool
    public var pageView: Bool
    public var intakeView: Bool
    public var isTimeTrackingEnabled: Bool
    public var isIssueTypeEnabled: Bool
    public var guestViewAllFeatures: Bool
    public var coverImage: String
    public var archiveIn: Int
    public var closeIn: Int
    public var archivedAt: String?
    public var createdBy: String
    public var updatedBy: String
    public var workspace: String
    public var defaultAssignee: NSNull
    public var projectLead: NSNull
    public var coverImageAsset: NSNull
    public var estimate: NSNull
    public var defaultState: NSNull
}
