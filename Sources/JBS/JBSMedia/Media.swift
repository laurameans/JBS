//
//  File.swift
//  
//
//  Created by Justin Means on 2/2/22.
//

import Foundation

public struct Media {
	public struct Global: Codable, Identifiable, Hashable {
		public init(id: UUID, filename: String, mediaURL: String, totalBytes: Int? = nil, mediaType: MediaType) {
			self.id = id
			self.filename = filename
			self.mediaURL = mediaURL
			self.totalBytes = totalBytes
			self.mediaType = mediaType
		}
		
		public var id: UUID
		public var filename: String
		public var mediaURL: String
		public var totalBytes: Int?
		public var mediaType: MediaType
	}
	
	public struct Personal: Codable {
		public init(putUploadRequestURL: String? = nil, global: Media.Global) {
			self.putUploadRequestURL = putUploadRequestURL
			self.global = global
		}
		
		public var putUploadRequestURL: String?
		public var global: Global
	}
	
	public struct UploadData: Codable {
		public init(bucketID: String? = nil, filename: String, totalBytes: Int? = nil, mediaType: MediaType) {
			self.bucketID = bucketID
			self.filename = filename
			self.totalBytes = totalBytes
			self.mediaType = mediaType
		}
		
		public var bucketID: String?
		public var filename: String
		public var totalBytes: Int?
		public var mediaType: MediaType
	}
}
