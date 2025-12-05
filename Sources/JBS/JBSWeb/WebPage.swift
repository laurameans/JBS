//
//  WebPage.swift
//
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

public enum WebPage {
    @PublicInit
    public struct Micro: DTO {
        public var id: UUID?
        public var title: String
        public var slug: String
        public var createdDate: Date?
        public var updatedDate: Date?
        public var visibility: Visibility
        public var taxonomy: WebTaxonomy?
        public var isTaxonomyBase: Bool?
        public var featuredImageURL: String?
        public var metaDescription: String?
        public var keywords: String?
        public var showCollectionDates: Bool?
    }

    @PublicInit
    public struct Global: DTO {
        public var micro: WebPage.Micro
        public var sections: [WebSection]
        public var createdBy: MainframeUserRepresentable.Micro?
        public var updatedBy: MainframeUserRepresentable.Micro?
    }

    public enum Visibility: String, DTO, CaseIterable {
        case published
        case draft
        case userAuthenticated
        case `internal`
        case confidential
        case restricted

        public var title: String {
            return switch self {
            case .published:
                "Published"
            case .draft:
                "Draft"
            case .userAuthenticated:
                "User Authenticated"
            case .internal:
                "Internal"
            case .confidential:
                "Confidential"
            case .restricted:
                "Restricted"
            }
        }

        public func isAuthorized(_ accessLevel: AccessLevel) -> Bool {
            switch accessLevel {
            case .internal:
                return self != .confidential && self != .restricted
            case .confidential:
                return self != .restricted
            case .restricted:
                return true
            }
        }
    }
}
