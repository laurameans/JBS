//
//  File.swift
//  
//
//  Created by Justin Means on 6/10/22.
//

import Foundation

public struct JBSUser {
	
	public struct Micro: MicroUserRepresentable {
		public init(id: UUID? = nil, name: String? = nil, username: String, profilePicURL: String? = nil) {
			self.id = id
			self.name = name
			self.username = username
			self.profilePicURL = profilePicURL
		}
		
		public var id: UUID?
		public var name: String?
		public var username: String
		public var profilePicURL: String?
		
	}
	
}
