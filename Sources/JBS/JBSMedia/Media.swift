//
//  Media.swift
//
//
//  Created by Justin Means on 2/2/22.
//

import Foundation

public enum Media {
    @PublicInit
    public struct Global: Codable, Identifiable, Hashable {
        public var id: UUID
        public var filename: String
        public var mediaURL: String
        public var totalBytes: Int?
        public var mediaType: MediaType
    }

    @PublicInit
    public struct Personal: Codable {
        public var putUploadRequestURL: String?
        public var global: Global
    }

    @PublicInit
    public struct UploadData: Codable {
        public var bucketID: String?
        public var filename: String
        public var totalBytes: Int?
        public var mediaType: MediaType
    }
}
