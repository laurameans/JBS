//
//  File.swift
//
//
//  Created by Justin Means on 12/8/22.
//

import Foundation
import JBS

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
	public var remoteImageURL: String?
	public var deviceModel: String?
	public var generationTimeSeconds: Float?
	public var hidePrompt: Bool?
#if !os(Linux)
	public var image: NSUIImage?
	public static var libraryDirectory: URL {
		FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("com.outtakes.ops.diffusion.library", isDirectory: true)
	}
	
	public var fileLocation: URL {
		Self.libraryDirectory.appendingPathComponent(id.uuidString).appendingPathExtension("odiff")
	}
	public var imageLocation: URL {
		Self.libraryDirectory.appendingPathComponent(id.uuidString).appendingPathExtension("jpeg")
	}
	
	public init(id: UUID = UUID(), remoteID: UUID? = nil, remoteImageURL: String?, image: NSUIImage? = nil, prompt: String, negativePrompt: String, stepCount: Int, seed: Int, disableSafety: Bool, createdDate: Date, scheduler: String?, guidanceScale: Float?, deviceModel: String?, generationTimeSeconds: Float?, hidePrompt: Bool?) {
		self.remoteID = remoteID
		self.id = id
		self.prompt = prompt
		self.negativePrompt = negativePrompt
		self.stepCount = stepCount
		self.seed = seed
		self.disableSafety = disableSafety
		self.createdDate = createdDate
		self.image = image
		self.scheduler = scheduler
		self.guidanceScale = guidanceScale
		self.remoteImageURL = remoteImageURL
		self.deviceModel = deviceModel
		self.generationTimeSeconds = generationTimeSeconds
		self.hidePrompt = hidePrompt
	}
#else
	public init(id: UUID = UUID(), remoteID: UUID? = nil, remoteImageURL: String?, prompt: String, negativePrompt: String, stepCount: Int, seed: Int, disableSafety: Bool, createdDate: Date, scheduler: String?, guidanceScale: Float?, deviceModel: String?, generationTimeSeconds: Float?, hidePrompt: Bool?) {
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
		self.deviceModel = deviceModel
		self.generationTimeSeconds = generationTimeSeconds
		self.hidePrompt = hidePrompt
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
		case deviceModel
		case generationTimeSeconds
		case hidePrompt
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
		self.init(id: id, remoteID: remoteID, remoteImageURL: remoteImageURL, prompt: prompt, negativePrompt: negativePrompt, stepCount: stepCount, seed: seed, disableSafety: disableSafety, createdDate: createdDate, scheduler: scheduler, guidanceScale: guidanceScale, deviceModel: deviceModel, generationTimeSeconds: generationTimeSeconds, hidePrompt: hidePrompt)
		let imageLocation = Self.libraryDirectory.appendingPathComponent(id.uuidString).appendingPathExtension("jpeg")
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
	}
}

#else
extension GeneratedImage: Codable { }
#endif
