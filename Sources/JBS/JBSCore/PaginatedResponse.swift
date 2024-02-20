//
//  PaginatedResponse.swift
//
//
//  Created by Justin Means on 5/3/22.
//

import Foundation

@PublicInit
public struct PaginatedResponse<Items>: Codable, Equatable, Sendable where Items: Codable, Items: RangeReplaceableCollection, Items: Equatable & Sendable {
    public var items: Items
    public var metadata: Metadata

    @PublicInit
    public struct Metadata: DTO {
        public var page: Int
        public var per: Int
        public var total: Int
    }
}
