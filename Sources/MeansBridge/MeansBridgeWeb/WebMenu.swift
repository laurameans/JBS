//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebMenu: DTO {
    public var elements: [WebMenu.Element]
    public var lightLogoImageURL: String?
    public var darkLogoImageURL: String?
    
    @PublicInit
    public struct Element: DTO {
        public let id: UUID
        public var title: String
        public var link: String
    }
}
