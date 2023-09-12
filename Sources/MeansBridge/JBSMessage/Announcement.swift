//
//  File.swift
//  
//
//  Created by Justin Means on 6/13/23.
//

import Foundation

public struct Announcement: Codable, Identifiable, Equatable, Hashable {
    public init(id: UUID? = nil, title: String, subtitle: String, markdown: String? = nil, createdDate: Date? = nil, imageURL: String, linkURL: String? = nil, mode: Announcement.Mode, published: Bool) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.markdown = markdown
        self.createdDate = createdDate
        self.imageURL = imageURL
        self.linkURL = linkURL
        self.mode = mode
        self.published = published
    }
    
    public var id: UUID?
    public var title: String
    public var subtitle: String
    public var markdown: String?
    public var createdDate: Date?
    public var imageURL: String
    public var linkURL: String?
    public var mode: Announcement.Mode
    public var published: Bool
    
    public enum Mode: String, Codable, CaseIterable {
        case announcement
        case article
        case guide
        
        public var title: String {
            switch self {
                case .announcement:
                    return "Announcement"
                case .article:
                    return "Article"
                case .guide:
                    return "Guide"
            }
        }
    }
}
