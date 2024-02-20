//
//  MediaType.swift
//
//
//  Created by Justin Means on 2/2/22.
//

import Foundation

public enum MediaType: StringLiteralType, RawRepresentable, Codable {
    public static let schema = "jws_media_type_enum"
    case image
    case pdf
    case audio
    case video
    case hls
    case data
    case zip
    case m4s
    case heic

    public var contentType: String {
        switch self {
        case .image:
            return "image/jpeg"
        case .heic:
            return "image/heic"
        case .pdf:
            return "application/pdf"
        case .audio:
            return "audio/mpeg"
        case .video:
            return "video/mp4"
        case .hls:
            return "application/x-mpegURL"
        case .data:
            return "application/octet-stream"
        case .zip:
            return "application/zip"
        case .m4s:
            return "video/iso.segment"
        }
    }
}
