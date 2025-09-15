//
//  PortfolioItem.swift
//
//
//  Created by Justin Means on 1/15/25.
//

import Foundation

@PublicInit
public struct PortfolioItem: DTO {
    public var id: UUID
    public var title: String
    public var subtitle: String?
    public var hero: String
    public var images: [String]
    public var link: String?
}

@PublicInit
public struct PortfolioConfig: DTO {
    public enum LayoutType: String, DTO {
        case grid
        case masonry
    }

    public enum AspectRatio: String, DTO {
        case square
        case landscape
        case portrait
        case original
    }

    public var layout: LayoutType = .grid
    public var columns: Int = 3
    public var spacing: String = "normal"
    public var aspectRatio: AspectRatio = .square
}

@PublicInit
public struct PortfolioContent: DTO {
    public var items: [PortfolioItem]
    public var config: PortfolioConfig
}