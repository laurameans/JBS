//
//  File.swift
//
//
//  Created by Justin Means on 12/8/22.
//

import Foundation
import MeansBridge

public protocol DiffusionGenerated: Identifiable, Hashable {
	var id: UUID { get set }
	var prompt: String { get set }
	var negativePrompt: String { get set }
	var stepCount: Int { get set }
	var seed: Int { get set }
	var createdDate: Date { get set }
	var scheduler: String? { get set }
	var guidanceScale: Float? { get set }
	var deviceModel: String? { get set }
	var generationTimeSeconds: Float? { get set }
	var hidePrompt: Bool? { get set }
    var upscaled: Bool? { get set }
}

public struct UserGeneratedImage<User: MicroUserRepresentable>: Codable, Identifiable, Hashable {
	public var id: UUID? { generatedImage.remoteID }
	
	public var user: User
	public var generatedImage: GeneratedImage
	
	
	public init(user: User, generatedImage: GeneratedImage) {
		self.user = user
		self.generatedImage = generatedImage
	}
}

public struct GeneratedImage: DiffusionGenerated {
    public var upscaled: Bool?
    
	public var remoteID: UUID?
	public var id: UUID = UUID()
	public var prompt: String
	public var negativePrompt: String
	public var stepCount: Int
	public var seed: Int
	public var disableSafety: Bool
	public var createdDate: Date
	public var scheduler: String?
	public var guidanceScale: Float?
    public var imageDestruction: Float?
	public var remoteImageURL: String?
    public var remoteOriginalImageURL: String?
    public var controlImageURLs: [String]?
    public var presetID: Int?
	public var deviceModel: String?
	public var generationTimeSeconds: Float?
	public var hidePrompt: Bool?
#if !os(Linux)
	public var image: NSUIImage?
    public var originalImage: NSUIImage?
    public var controlImages: [NSUIImage]?
	public static var libraryDirectory: URL {
		FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("com.outtakes.ops.diffusion.library", isDirectory: true)
	}
	
	public var fileLocation: URL {
		Self.libraryDirectory.appendingPathComponent(id.uuidString).appendingPathExtension("odiff")
	}
	public var imageLocation: URL {
		Self.libraryDirectory.appendingPathComponent(id.uuidString).appendingPathExtension("heic")
	}
	
    public init(id: UUID = UUID(), remoteID: UUID? = nil, remoteImageURL: String?, remoteOriginalImageURL: String?, controlImageURLs: [String]?, image: NSUIImage? = nil, originalImage: NSUIImage? = nil, prompt: String, negativePrompt: String, stepCount: Int, seed: Int, disableSafety: Bool, createdDate: Date, scheduler: String?, guidanceScale: Float?, imageDestruction: Float?, deviceModel: String?, generationTimeSeconds: Float?, hidePrompt: Bool?, presetID: Int?, upscaled: Bool?) {
		self.remoteID = remoteID
		self.id = id
		self.prompt = prompt
		self.negativePrompt = negativePrompt
		self.stepCount = stepCount
		self.seed = seed
		self.disableSafety = disableSafety
		self.createdDate = createdDate
		self.image = image
        self.originalImage = originalImage
		self.scheduler = scheduler
		self.guidanceScale = guidanceScale
		self.remoteImageURL = remoteImageURL
        self.remoteOriginalImageURL = remoteOriginalImageURL
        self.controlImageURLs = controlImageURLs
        self.imageDestruction = imageDestruction
		self.deviceModel = deviceModel
		self.generationTimeSeconds = generationTimeSeconds
		self.hidePrompt = hidePrompt
        self.presetID = presetID
        self.upscaled = upscaled
	}
#else
    public init(id: UUID = UUID(), remoteID: UUID? = nil, remoteImageURL: String?, remoteOriginalImageURL: String?, controlImageURLs: [String]?, prompt: String, negativePrompt: String, stepCount: Int, seed: Int, disableSafety: Bool, createdDate: Date, scheduler: String?, guidanceScale: Float?, imageDestruction: Float?, deviceModel: String?, generationTimeSeconds: Float?, hidePrompt: Bool?, presetID: Int?, upscaled: Bool?) {
		self.remoteID = remoteID
		self.id = id
		self.prompt = prompt
		self.negativePrompt = negativePrompt
		self.stepCount = stepCount
		self.seed = seed
		self.disableSafety = disableSafety
		self.createdDate = createdDate
		self.scheduler = scheduler
		self.guidanceScale = guidanceScale
		self.remoteImageURL = remoteImageURL
        self.remoteOriginalImageURL = remoteOriginalImageURL
        self.controlImageURLs = controlImageURLs
        self.imageDestruction = imageDestruction
		self.deviceModel = deviceModel
		self.generationTimeSeconds = generationTimeSeconds
		self.hidePrompt = hidePrompt
        self.presetID = presetID
        self.upscaled = upscaled
	}
#endif
	public enum CodingKeys: CodingKey {
		case id
		case remoteID
		case prompt
		case negativePrompt
		case stepCount
		case seed
		case disableSafety
		case createdDate
		case scheduler
		case guidanceScale
		case remoteImageURL
        case remoteOriginalImageURL
        case controlImageURLs
        case imageDestruction
		case deviceModel
		case generationTimeSeconds
		case hidePrompt
        case presetID
        case upscaled
	}
}

//public enum SchedulerType: String, Codable, CaseIterable {
//	case pndm
//	case dpmMultistep
//
//	public var title: String {
//		switch self {
//		case .pndm:
//			return "PNDM"
//		case .dpmMultistep:
//			return "DPM-Solver++"
//		}
//	}
//
//
//}

#if !os(Linux)
extension GeneratedImage: Codable {
	public init(from decoder: Decoder) throws {
		let container: KeyedDecodingContainer<GeneratedImage.CodingKeys> = try decoder.container(keyedBy: GeneratedImage.CodingKeys.self)
		let id = try container.decode(UUID.self, forKey: GeneratedImage.CodingKeys.id)
		let remoteID = try container.decodeIfPresent(UUID.self, forKey: GeneratedImage.CodingKeys.remoteID)
		let remoteImageURL = try container.decodeIfPresent(String.self, forKey: .remoteImageURL)
		let prompt = try container.decode(String.self, forKey: GeneratedImage.CodingKeys.prompt)
		let negativePrompt = try container.decode(String.self, forKey: GeneratedImage.CodingKeys.negativePrompt)
		let stepCount = try container.decode(Int.self, forKey: GeneratedImage.CodingKeys.stepCount)
		let seed = try container.decode(Int.self, forKey: GeneratedImage.CodingKeys.seed)
		let disableSafety = try container.decode(Bool.self, forKey: GeneratedImage.CodingKeys.disableSafety)
		let createdDate = try container.decode(Date.self, forKey: GeneratedImage.CodingKeys.createdDate)
		let scheduler = try container.decodeIfPresent(String.self, forKey: .scheduler)
		let guidanceScale = try container.decodeIfPresent(Float.self, forKey: .guidanceScale)
		let deviceModel = try container.decodeIfPresent(String.self, forKey: .deviceModel)
		let generationTimeSeconds = try container.decodeIfPresent(Float.self, forKey: .generationTimeSeconds)
		let hidePrompt = try container.decodeIfPresent(Bool.self, forKey: .hidePrompt)
        let remoteOriginalImageURL = try container.decodeIfPresent(String.self, forKey: .remoteOriginalImageURL)
        let controlImageURLs = try container.decodeIfPresent([String].self, forKey: .controlImageURLs)
        let imageDestruction = try container.decodeIfPresent(Float.self, forKey: .imageDestruction)
        let presetID = try container.decodeIfPresent(Int.self, forKey: .presetID)
        let upscaled = try container.decodeIfPresent(Bool.self, forKey: .upscaled)
        self.init(id: id, remoteID: remoteID, remoteImageURL: remoteImageURL, remoteOriginalImageURL: remoteOriginalImageURL, controlImageURLs: controlImageURLs, prompt: prompt, negativePrompt: negativePrompt, stepCount: stepCount, seed: seed, disableSafety: disableSafety, createdDate: createdDate, scheduler: scheduler, guidanceScale: guidanceScale, imageDestruction: imageDestruction, deviceModel: deviceModel, generationTimeSeconds: generationTimeSeconds, hidePrompt: hidePrompt, presetID: presetID, upscaled: upscaled)
        let base = Self.libraryDirectory.appendingPathComponent(id.uuidString)
        var imageLocation: URL!
        if FileManager.default.fileExists(atPath: base.appendingPathExtension("heic").path) {
            imageLocation = base.appendingPathExtension("heic")
        } else {
            imageLocation = base.appendingPathExtension("jpeg")
        }
		let data = try? Data(contentsOf: imageLocation)
		if let data = data {
			self.image = NSUIImage(data: data)
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container: KeyedEncodingContainer<GeneratedImage.CodingKeys> = encoder.container(keyedBy: GeneratedImage.CodingKeys.self)
		try container.encode(self.id, forKey: GeneratedImage.CodingKeys.id)
		try container.encode(self.prompt, forKey: GeneratedImage.CodingKeys.prompt)
		try container.encode(self.negativePrompt, forKey: GeneratedImage.CodingKeys.negativePrompt)
		try container.encode(self.stepCount, forKey: GeneratedImage.CodingKeys.stepCount)
		try container.encode(self.seed, forKey: GeneratedImage.CodingKeys.seed)
		try container.encode(self.disableSafety, forKey: GeneratedImage.CodingKeys.disableSafety)
		try container.encode(self.createdDate, forKey: GeneratedImage.CodingKeys.createdDate)
		try container.encode(self.scheduler, forKey: .scheduler)
		try container.encode(self.guidanceScale, forKey: .guidanceScale)
		try container.encode(self.remoteID, forKey: .remoteID)
		try container.encode(self.remoteImageURL, forKey: .remoteImageURL)
		try container.encode(self.deviceModel, forKey: .deviceModel)
		try container.encode(self.generationTimeSeconds, forKey: .generationTimeSeconds)
		try container.encode(self.hidePrompt, forKey: .hidePrompt)
        try container.encode(self.remoteOriginalImageURL, forKey: .remoteOriginalImageURL)
        try container.encode(self.controlImageURLs, forKey: .controlImageURLs)
        try container.encode(self.imageDestruction, forKey: .imageDestruction)
        try container.encode(self.presetID, forKey: .presetID)
        try container.encode(self.upscaled, forKey: .upscaled)
	}
}

#else
extension GeneratedImage: Codable { }
#endif

public extension GeneratedImage {
    static var empty: GeneratedImage {
        GeneratedImage(remoteImageURL: nil, remoteOriginalImageURL: nil, controlImageURLs: nil, prompt: "", negativePrompt: "", stepCount: 0, seed: 0, disableSafety: false, createdDate: Date(), scheduler: nil, guidanceScale: nil, imageDestruction: nil, deviceModel: nil, generationTimeSeconds: nil, hidePrompt: nil, presetID: nil, upscaled: false)
    }
}
