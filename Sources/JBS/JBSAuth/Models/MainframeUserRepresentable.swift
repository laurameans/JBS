//
//  File.swift
//  
//
//  Created by Justin Means on 5/29/22.
//

import Foundation

public struct MainframeUserRepresentable {
	public struct Micro: Codable, Hashable, Equatable, Sendable {
		public init(username: String, profilePicURL: String? = nil, lastConnected: Date? = nil, name: String? = nil, appName: JBSAppName, id: UUID? = nil, lastIPLog: IPLog? = nil) {
			self.username = username
			self.profilePicURL = profilePicURL
			self.lastConnected = lastConnected
			self.name = name
			self.appName = appName
			self.id = id
			self.lastIPLog = lastIPLog
		}
		
		public var username: String
		public var profilePicURL: String?
		public var lastConnected: Date?
		public var name: String?
		public var appName: JBSAppName
		public var id: UUID?
		public var lastIPLog: IPLog?
	}
}
