//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct Website: DTO {
    public var host: String
    public var title: String
    public var slogan: String?
    public var faviconURL: String?
    public var headerImageURLLight: String?
    public var headerImageURLDark: String?
    public var footerImageURLLight: String?
    public var footerImageURLDark: String?
}
