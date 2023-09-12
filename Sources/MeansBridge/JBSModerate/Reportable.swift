//
//  File.swift
//  
//
//  Created by Justin Means on 12/15/21.
//

import Foundation

public protocol Reportable: Codable {
	var schema: ReportSchema { get }
	var reportMeta: ReportMetadata { get }
	var id: UUID? { get }
//	var id: UUID? { get }
}

public struct ReportMetadata {
	public init(title: String? = nil, imageURLString: String? = nil, creatorName: String? = nil, date: Date? = nil) {
		self.title = title
		self.imageURLString = imageURLString
		self.creatorName = creatorName
		self.date = date
	}
	
	public var title: String?
	public var imageURLString: String?
	public var creatorName: String?
	public var date: Date?
}
