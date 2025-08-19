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

    public enum CodingKeys: String, CodingKey {
        case status
        case requestID = "request_id"
        case responseURL = "response_url"
        case statusURL = "status_url"
        case cancelURL = "cancel_url"
        case metrics
        case queuePosition = "queue_position"
    }
}

// MARK: - GenDreamStatusResponse

@PublicInit
public struct GenDreamStatusResponse: DTO {
    public var requestID: String
    public var queuePosition: Int

    enum CodingKeys: String, CodingKey {
        case requestID = "request_id"
        case queuePosition = "queue_position"
    }
}

// MARK: - GenDreamTextToImageRequest

@PublicInit
public struct GenDreamTextToImageRequest: DTO {
    public var prompt: String
    public var seed: Int = Int.random(in: 0...999_999)
    public var imageSize: ImageSize

    enum CodingKeys: String, CodingKey {
        case prompt
        case imageSize = "image_size"
        case seed
    }
}

// MARK: - FalTrellisRequest

@PublicInit
public struct FalTrellisRequest: DTO {
    public var imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}

@PublicInit
public struct FalImageEditRequest: DTO {
    public var prompt: String
    public var imageURL: String
    public var seed: Int = Int.random(in: 0...999_999)
    public var numInferenceSteps: Int?
    public var guidanceScale: Float?
    public var negativePrompt: String?
    
    enum CodingKeys: String, CodingKey {
        case prompt
        case imageURL = "image_url"
        case seed
        case numInferenceSteps = "num_inference_steps"
        case guidanceScale = "guidance_scale"
        case negativePrompt = "negative_prompt"
    }
}

@PublicInit
public struct WanFLF2VRequest: DTO {
    public var prompt: String
    public var startImageURL: String
    public var endImageURL: String
    public var seed: Int = Int.random(in: 0...999_999)
    
    enum CodingKeys: String, CodingKey {
        case prompt
        case startImageURL = "start_image_url"
        case endImageURL = "end_image_url"
        case seed
    }
}

// MARK: - ImageSize

@PublicInit
public struct ImageSize: DTO {
    public var width: CGFloat
    public var height: CGFloat
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
@PublicInit
public struct FALFluxResponse: DTO {
    public var images: [FALImage]
//    public var timings: FALTimings?
    public var seed: Int
    public var hasNsfwConcepts: [Bool]
    public var prompt: String

    enum CodingKeys: String, CodingKey {
        case images
//        case timings
        case seed
        case hasNsfwConcepts = "has_nsfw_concepts"
        case prompt
    }
}

// MARK: - FALImage
@PublicInit
public struct FALImage: DTO {
    public var url: String
    public var width: Int
    public var height: Int
    public var contentType: String

    enum CodingKeys: String, CodingKey {
        case url
        case width
        case height
        case contentType = "content_type"
    }
}

// MARK: - FALTrellisResponse
@PublicInit
public struct FALTrellisResponse: DTO {
    public var modelMesh: FALAsset
    public var timings: FALTrellisTimings

    public enum CodingKeys: String, CodingKey {
        case modelMesh = "model_mesh"
        case timings
    }
}

@PublicInit
public struct FALWANFLF2VResponse: DTO {
    public var video: FALAsset
    public var seed: Int
    
    public enum CodingKeys: String, CodingKey {
        case video
        case seed
    }
}

// MARK: - FALModelMesh
@PublicInit
public struct FALAsset: DTO {
    public var url: String
    public var contentType: String
    public var fileName: String
    public var fileSize: Int

    public enum CodingKeys: String, CodingKey {
        case url
        case contentType = "content_type"
        case fileName = "file_name"
        case fileSize = "file_size"
    }
}

// MARK: - FALTrellisTimings
@PublicInit
public struct FALTrellisTimings: DTO {
    public var prepare: Double
    public var generation: Double
    public var export: Double
}

// MARK: - FALTimings
@PublicInit
public struct FALTimings: DTO {
    public var inference: Double

    enum CodingKeys: String, CodingKey {
        case inference
    }
}

// MARK: - FalLLMResponse
@PublicInit
public struct FalLLMResponse: Hashable, Sendable {
    public var output: String
    public var reasoning: NSNull
    public var partial: Bool
    public var error: NSNull
}

// MARK: - FalLLMRequest
@PublicInit
public struct FalLLMRequest: Hashable, Sendable {
    public var status: String
    public var requestID: String
    public var responseURL: String
    public var statusURL: String
    public var cancelURL: String
    public var queuePosition: Int
}

public enum CreditCost: String, CaseIterable {
    case fluxSchnell
    case fluxKontext
    case qwenImageEdit
    case trellis
    case wanflf2v
    
    public var cost: Int {
        switch self {
            case .fluxSchnell: 1
            case .fluxKontext: 10
            case .qwenImageEdit: 10
            case .trellis: 5
            case .wanflf2v: 50
        }
    }
}
