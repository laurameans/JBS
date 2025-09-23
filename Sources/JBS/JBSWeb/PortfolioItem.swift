//
//  PortfolioItem.swift
//
//
//  Created by Justin Means on 1/15/25.
//

import Foundation

@PublicInit
public struct PortfolioMediaItem: DTO {
    public enum MediaType: String, DTO {
        case image
        case iframe
        case video
    }

    public var type: MediaType = .image
    public var url: String
    public var thumbnail: String?
    public var width: String?
    public var height: String?
    public var title: String?
    public var description: String?
}

public struct PortfolioItem: DTO, Codable {
    public var id: UUID
    public var title: String
    public var subtitle: String?
    public var hero: String
    public var mediaItems: [PortfolioMediaItem]?
    public var link: String?
    public var images: [String]?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        hero = try container.decode(String.self, forKey: .hero)
        link = try container.decodeIfPresent(String.self, forKey: .link)

        if let media = try container.decodeIfPresent([PortfolioMediaItem].self, forKey: .mediaItems) {
            mediaItems = media
            images = media.compactMap { $0.type == .image ? $0.url : nil }
        } else if let imgs = try container.decodeIfPresent([String].self, forKey: .images) {
            images = imgs
            mediaItems = imgs.map { PortfolioMediaItem(type: .image, url: $0) }
        } else {
            mediaItems = []
            images = []
        }
    }

    public init(id: UUID, title: String, subtitle: String? = nil, hero: String, mediaItems: [PortfolioMediaItem]? = nil, link: String? = nil, images: [String]? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.hero = hero
        self.link = link

        if let media = mediaItems {
            self.mediaItems = media
            self.images = media.compactMap { $0.type == .image ? $0.url : nil }
        } else if let imgs = images {
            self.images = imgs
            self.mediaItems = imgs.map { PortfolioMediaItem(type: .image, url: $0) }
        } else {
            self.mediaItems = []
            self.images = []
        }
    }

    private enum CodingKeys: String, CodingKey {
        case id, title, subtitle, hero, mediaItems, link, images
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(subtitle, forKey: .subtitle)
        try container.encode(hero, forKey: .hero)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(mediaItems, forKey: .mediaItems)
        try container.encodeIfPresent(images, forKey: .images)
    }
}

@PublicInit
public struct PortfolioConfig: DTO {
    public enum AspectRatio: String, DTO {
        case square
        case landscape
        case portrait
        case original
    }

    public var spacing: String = "normal"
    public var aspectRatio: AspectRatio = .square
}

@PublicInit
public struct PortfolioContent: DTO {
    public var items: [PortfolioItem]
    public var config: PortfolioConfig
}