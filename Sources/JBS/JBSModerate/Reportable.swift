//
//  Reportable.swift
//
//
//  Created by Justin Means on 12/15/21.
//

import Foundation

public protocol Reportable: Codable {
    var schema: ReportSchema { get }
    var reportMeta: ReportMetadata { get }
    var id: UUID? { get }
}

@PublicInit
public struct ReportMetadata {
    public var title: String?
    public var imageURLString: String?
    public var creatorName: String?
    public var date: Date?
}
