//
//  Website.swift
//
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct Website: DTO {
    public var id: UUID
    public var host: String
    public var title: String
    public var slogan: String?
    public var faviconURL: String?
    public var headerMenu: WebMenu?
    public var footerMenu: WebMenu?
    public var stylesheetURL: String?
    public var stylesheetContent: String?
    public var cloudflareZoneIDs: [String: String]?
}
