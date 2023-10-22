//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

public struct WebPage {
    
    @PublicInit
    public struct Micro: DTO {
        public var title: String
        public var slug: String
        public var createdDate: Date?
        public var updatedDate: Date?
        public var visibility: Visibility
        public var taxonomy: WebTaxonomy?
        public var isTaxonomyBase: Bool?
    }
    
    @PublicInit
    public struct Global: DTO {
        public var micro: WebPage.Micro
        public var sections: [WebSection]
        public var createdBy: MainframeUserRepresentable.Micro?
        public var updatedBy: MainframeUserRepresentable.Micro?
    }
    
    public enum Visibility: String, DTO {
        case published
        case draft
        case userAuthenticated
        case `internal`
    }
}
