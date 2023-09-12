//
//  File.swift
//  
//
//  Created by Justin Means on 5/3/22.
//

import Foundation

public struct PaginatedResponse<Items>: Codable, Equatable, Sendable where Items: Codable, Items: RangeReplaceableCollection, Items: Equatable & Sendable {
	
	public init(items: Items, metadata: PaginatedResponse<Items>.Metadata) {
		self.items = items
		self.metadata = metadata
	}
	
	public var items: Items
	public var metadata: Metadata
	
	public struct Metadata: Codable, Equatable, Sendable {
		public init(page: Int, per: Int, total: Int) {
			self.page = page
			self.per = per
			self.total = total
		}
		
		public var page: Int
		public var per: Int
		public var total: Int
	}
}
