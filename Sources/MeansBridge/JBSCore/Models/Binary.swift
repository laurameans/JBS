//
//  File.swift
//  
//
//  Created by Justin Means on 1/23/23.
//

import Foundation

public struct Binary: Codable, Hashable, Equatable, Sendable {
	public init(id: UUID? = nil, zipURL: String, version: String, releaseNotes: String, releaseDescription: String, createdDate: Date? = nil, updatedDate: Date? = nil) {
		self.id = id
		self.zipURL = zipURL
		self.version = version
		self.releaseNotes = releaseNotes
		self.releaseDescription = releaseDescription
		self.createdDate = createdDate
		self.updatedDate = updatedDate
	}
	
	public var id: UUID?
	public var zipURL: String
	public var version: String
	public var releaseNotes: String
	public var releaseDescription: String
	public var createdDate: Date?
	public var updatedDate: Date?
}
