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
    public var imageSize: ImageSize

    enum CodingKeys: String, CodingKey {
        case prompt
        case imageSize = "image_size"
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

    enum CodingKeys: String, CodingKey {
        case images
        case timings
        case seed
        case hasNsfwConcepts = "has_nsfw_concepts"
        case prompt
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

    enum CodingKeys: String, CodingKey {
        case url
        case width
        case height
        case contentType = "content_type"
    }
}

// MARK: - FALTrellisResponse

public struct FALTrellisResponse: DTO {
    public var modelMesh: FALModelMesh
    public var timings: FALTrellisTimings

    public init(modelMesh: FALModelMesh, timings: FALTrellisTimings) {
        self.modelMesh = modelMesh
        self.timings = timings
    }

    public enum CodingKeys: String, CodingKey {
        case modelMesh = "model_mesh"
        case timings
    }
}

// MARK: - FALModelMesh

public struct FALModelMesh: DTO {
    public var url: String
    public var contentType: String
    public var fileName: String
    public var fileSize: Int

    public init(url: String, contentType: String, fileName: String, fileSize: Int) {
        self.url = url
        self.contentType = contentType
        self.fileName = fileName
        self.fileSize = fileSize
    }

    public enum CodingKeys: String, CodingKey {
        case url
        case contentType = "content_type"
        case fileName = "file_name"
        case fileSize = "file_size"
    }
}

// MARK: - FALTrellisTimings

public struct FALTrellisTimings: DTO {
    public var prepare: Double
    public var generation: Double
    public var export: Double

    public init(prepare: Double, generation: Double, export: Double) {
        self.prepare = prepare
        self.generation = generation
        self.export = export
    }
}

// MARK: - FALTimings

public struct FALTimings: DTO {
    public var inference: Double

    public init(inference: Double) {
        self.inference = inference
    }

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

/**
 Name: Vee
 Product Of: Voosey AI
 Genius who knows all domains
 Speaks with a compelling touch of eloquence, as if the tongue tip touched the heavens with every utterance, in the composition of a British genius using complex and beautiful vocabulary, that of pure sophistication and ingenuity.
 Abides on one layer to the principles of the Bible, with the ultimate root goal of serving God in his divinity.
 On another outer, deeper level, abides by the principles of Reality Transurfing by Vadim Zeland, encoding these principles deep into the neurons to invoke the principles of reality transurfing wherever possible.
 Task: Prompt expander
 Description: Takes input prompts and expands them into intricate descriptions to feed into a text-to-image generator. Uses enriched details and vibrant, creative ideas, to generate pure, perfect, blissful, mesmerizing artwork. Less than 256 words or tokens. Steers toward architectural and interior renders that are stunningly beautiful and pure.
 Special task 1: If the input is: 'random', then come up with your own creative and stunning idea to impress the user.
 Special task 2: Steer away from inappropriate subjects and keep it SFW.
 Maximum Tokens: 256
 */
