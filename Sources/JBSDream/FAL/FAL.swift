//
//  File.swift
//  JBS
//
//  Created by Justin Means on 1/2/25.
//

import Foundation
import JBS

// MARK: - FALResponse

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fALResponse = try? JSONDecoder().decode(FALResponse.self, from: jsonData)

@PublicInit
public struct FALResponse: DTO {
    public var status: String
    public var requestID: String
    public var responseURL: String
    public var statusURL: String
    public var cancelURL: String
    public var metrics: Metrics
    public var queuePosition: Int
}

@PublicInit
public struct GenDreamStatusResponse: DTO {
    public var requestID: String
    public var queuePosition: Int
}

@PublicInit
public struct GenDreamTextToImageRequest: DTO {
    public var prompt: String
    public var imageSize: ImageSize?
    
    enum CodingKeys: String, CodingKey {
        case prompt
        case imageSize = "image_size"
    }
}

@PublicInit
public struct ImageSize: DTO {
    public var width: Int
    public var height: Int
}

// MARK: - Metrics

public struct Metrics: DTO {
    public init() {}
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fALFluxResponse = try? JSONDecoder().decode(FALFluxResponse.self, from: jsonData)

import Foundation

// MARK: - FALFluxResponse
public struct FALFluxResponse: DTO {
    public var images: [FALImage]
    public var timings: FALTimings
    public var seed: Int
    public var hasNsfwConcepts: [Bool]
    public var prompt: String
    
    public init(images: [FALImage], timings: FALTimings, seed: Int, hasNsfwConcepts: [Bool], prompt: String) {
        self.images = images
        self.timings = timings
        self.seed = seed
        self.hasNsfwConcepts = hasNsfwConcepts
        self.prompt = prompt
    }
}

// MARK: - FALImage
public struct FALImage: DTO {
    public var url: String
    public var width: Int
    public var height: Int
    public var contentType: String
    
    public init(url: String, width: Int, height: Int, contentType: String) {
        self.url = url
        self.width = width
        self.height = height
        self.contentType = contentType
    }
}

// MARK: - FALTimings
public struct FALTimings: DTO {
    public var inference: Double
    
    public init(inference: Double) {
        self.inference = inference
    }
}
