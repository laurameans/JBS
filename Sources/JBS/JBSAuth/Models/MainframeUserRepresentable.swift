//
//  MainframeUserRepresentable.swift
//
//
//  Created by Justin Means on 5/29/22.
//

import Foundation

public enum MainframeUserRepresentable {
    @PublicInit
    public struct Micro: Codable, Hashable, Equatable, Sendable {
        public var username: String?
        public var profilePicURL: String?
        public var lastConnected: Date?
        public var name: String?
        public var appName: JBSAppName
        public var id: UUID?
        public var lastIPLog: IPLog?
        public var dailyEngagement: [String: Engagement]?
    }
}
