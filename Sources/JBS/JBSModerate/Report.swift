//
//  File.swift
//  
//
//  Created by Justin Means on 12/15/21.
//

import Foundation

public struct Report: Codable {
	public struct Put: Codable {
		public init(category: ReportCategory, additionalInformation: String, schema: ReportSchema, modelID: UUID) {
			self.category = category
			self.additionalInformation = additionalInformation
			self.schema = schema
			self.modelID = modelID
		}
		
		public var category: ReportCategory
		public var additionalInformation: String
		public var schema: ReportSchema
		public var modelID: UUID
	}
	
	public struct Global: Codable {
		
	}
}

public struct ReportSchema: RawRepresentable, Equatable, Sendable, Codable {
	public init(rawValue: String) {
		self.rawValue = rawValue
	}
	
	public var rawValue: String
	
//	enum Values: String, RawRepresentable, CustomStringConvertible {
//		case
//	}
	
	public typealias RawValue = String
	
	
}

public extension ReportSchema {
	static let user = ReportSchema(rawValue: "user")
}
