//
//  File.swift
//  
//
//  Created by Justin Means on 9/19/22.
//

import Foundation
import JBS

public struct Replicate {
	public struct Prediction: Codable, Hashable, Sendable {
		public var id: String
		public var version: String
		public var urls: Urls
		public var createdAt: String?
		public var completedAt: String?
		public var status: Status
		public var input: Input
		public var output: [String]?
		public var error: String?
		public var logs: String?
		public var metrics: Metrics
		
		enum CodingKeys: String, CodingKey {
			case id = "id"
			case version = "version"
			case urls = "urls"
			case createdAt = "created_at"
			case completedAt = "completed_at"
			case status = "status"
			case input = "input"
			case output = "output"
			case error = "error"
			case logs = "logs"
			case metrics = "metrics"
		}
		
		public enum Status: String, RawRepresentable, Codable, Hashable, Sendable {
			case starting
			case processing
			case succeeded
			case failed
			case canceled
		}
		
		public init(id: String, version: String, urls: Replicate.Prediction.Urls, createdAt: String? = nil, completedAt: String? = nil, status: Status, input: Replicate.Prediction.Input, output: [String], error: String? = nil, logs: String? = nil, metrics: Replicate.Prediction.Metrics) {
			self.id = id
			self.version = version
			self.urls = urls
			self.createdAt = createdAt
			self.completedAt = completedAt
			self.status = status
			self.input = input
			self.output = output
			self.error = error
			self.logs = logs
			self.metrics = metrics
		}
		
		public struct Create: Codable, Hashable, Sendable {
			public init(version: Version, input: Replicate.Prediction.Input, webhookCompleted: String? = nil) {
				self.version = version
				self.input = input
				self.webhookCompleted = webhookCompleted
			}
			
			public var version: Version
			public var input: Input
			public var webhookCompleted: String?
			
			public enum CodingKeys: String, CodingKey {
				case version, input
				case webhookCompleted = "webhook_completed"
			}
			
			public enum Version: String, RawRepresentable, Codable, Hashable, Sendable {
				case material = "56f26876a159c10b429c382f66ccda648c1d5678d7ce15ed010734b715be5ab9"
				case stableDiffusion = "a9758cbfbd5f3c2094457d996681af52552901775aa2d6dd0b17fd15df959bef"
				case stableDiffusionNSFW = "19a42e3e1f79e1f998e4738c55fb15879c05586064db93d5a22e11c4f9694e42"
			}
			
			public var creditsCost: Int {
				input.numOutputs ?? 1
			}
		}
		
		// MARK: - Input
		public struct Input: Codable, Hashable, Sendable {
			/// Input prompt
			public var prompt: String
			/// Width of output image. Maximum size is 1024x768 or 768x1024 because of memory limits
			public var width: Int?
			/// Height of output image. Maximum size is 1024x768 or 768x1024 because of memory limits
			public var height: Int?
			/// Prompt strength when using init image. 1.0 corresponds to full destruction of information in init image
			public var promptStrength: Double?
			/// Number of images to output
			public var numOutputs: Int?
			/// Number of denoising steps (minimum: 1; maximum: 500)
			public var numInferenceSteps: Int?
			/// Scale for classifier-free guidance (minimum: 1; maximum: 20)
			public var guidanceScale: Double?
			/// Random seed. Leave blank to randomize the seed
			public var seed: String?
			
			public init(prompt: String, width: Int? = nil, height: Int? = nil, promptStrength: Double? = nil, numOutputs: Int? = nil, numInferenceSteps: Int? = nil, guidanceScale: Double? = nil, seed: String? = nil) {
				self.prompt = prompt
				self.width = width
				self.height = height
				self.promptStrength = promptStrength
				self.numOutputs = numOutputs
				self.numInferenceSteps = numInferenceSteps
				self.guidanceScale = guidanceScale
				self.seed = seed
			}
			
			enum CodingKeys: String, CodingKey {
				case prompt = "prompt"
				case width
				case height
				case promptStrength = "prompt_strength"
				case numOutputs = "num_outputs"
				case numInferenceSteps = "num_inference_steps"
				case guidanceScale = "guidance_scale"
				case seed
			}
			
		}
		
		// MARK: - Metrics
		public struct Metrics: Codable, Hashable, Sendable {
			public var predictTime: Double?
			
			enum CodingKeys: String, CodingKey {
				case predictTime = "predict_time"
			}
			
			public init(predictTime: Double) {
				self.predictTime = predictTime
			}
		}
		
		// MARK: - Urls
		public struct Urls: Codable, Hashable, Sendable {
			public var urlsGet: String
			public var cancel: String
			
			enum CodingKeys: String, CodingKey {
				case urlsGet = "get"
				case cancel = "cancel"
			}
			
			public init(urlsGet: String, cancel: String) {
				self.urlsGet = urlsGet
				self.cancel = cancel
			}
		}
	}
}
