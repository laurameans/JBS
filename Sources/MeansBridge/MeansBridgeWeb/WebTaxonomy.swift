//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

public enum WebTaxonomy: String, DTO, CaseIterable {
    case article
    case devlog
    case documentation
    case `internal`
    
    public var title: String {
        switch self {
            case .article: "Article"
            case .devlog: "Developer Log"
            case .documentation: "Documentation"
            case .internal: "Internal"
        }
    }
}
