//
//  File.swift
//  
//
//  Created by Justin Means on 2/11/23.
//

import Foundation
import MeansBridge

public struct OpenAI {
	public static var encoder: JSONEncoder {
		let e = JSONEncoder()
		e.dateEncodingStrategy = .iso8601
		e.keyEncodingStrategy = .convertToSnakeCase
		return e
	}
	
	public struct AuthenticatedChatRequest: Codable {
		public init(request: OpenAI.ChatRequest, key: String) {
			self.request = request
			self.key = key
		}
		
		public var request: ChatRequest
		public var key: String
	}
    
	public struct UserChatRequest: Codable {
		public init(request: OpenAI.ChatRequest, title: String? = nil, id: UUID = UUID()) {
			self.request = request
			self.createdDate = Date()
			self.title = title
			self.id = id
		}
		
        public var request: ChatRequest
		public var createdDate: Date
		public var title: String?
		public var id: UUID
    }
	
	public struct ChatRequest: Codable {
		public init(model: String = "gpt-3.5-turbo", messages: [OpenAI.ChatMessage], temperature: Double? = 1, topP: Double? = 1, n: Int? = 1, stream: Bool = false, stop: [String]? = nil, presencePenalty: Double? = 0, frequencyPenalty: Double? = 0, user: String? = nil) {
			self.model = model
			self.messages = messages
			self.temperature = temperature
			self.topP = topP
			self.n = n
			self.stream = stream
			self.stop = stop
			self.presencePenalty = presencePenalty
			self.frequencyPenalty = frequencyPenalty
			self.user = user
		}
		
		public var model: String = "gpt-3.5-turbo"
		public var messages: [ChatMessage]
		/// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
		/// We generally recommend altering this or top_p but not both.
		public var temperature: Double? = 1
		/// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
		/// We generally recommend altering this or temperature but not both.
		public var topP: Double? = 1
		/// How many chat completion choices to generate for each input message.
		public var n: Int? = 1
		public var stream: Bool = false
		/// Up to 4 sequences where the API will stop generating further tokens.
		public var stop: [String]?
		public var presencePenalty: Double? = 0
		public var frequencyPenalty: Double? = 0
		/// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse.
		public var user: String?
		
	}
	
	public struct ChatResponse: Codable {
		public var id: String
		public var object: String
		public var created: Date
		public var choices: [ChatChoice]
		public var usage: ChatUsage
	}
	
	public struct ChatUsage: Codable {
		public var promptTokens: Int
		public var completionTokens: Int
		public var totalTokens: Int
	}
	
	public struct ChatChoice: Codable {
		public init(index: Int, message: OpenAI.ChatMessage, finishReason: String?) {
			self.index = index
			self.message = message
			self.finishReason = finishReason
		}
		
		public var index: Int
		public var message: ChatMessage
		public var finishReason: String?
	}
	
	public struct ChatMessage: Codable, Hashable {
		public init(role: OpenAI.ChatMessage.Role, content: String) {
			self.role = role
			self.content = content
		}
		
		public var role: Role
		public var content: String
		
		public enum Role: String, RawRepresentable, Codable {
			case system
			case assistant
			case user
		}
	}
	
	public struct CompletionRequest: Codable {
		public init(model: String, prompt: String, suffix: String? = nil, maxTokens: Int? = nil, temperature: Double? = nil, topP: Double? = nil, n: Int? = nil, stream: Bool? = nil, logprobs: Int? = nil, echo: Bool? = nil, stop: String? = nil, presencePenalty: Double? = nil, frequencyPenalty: Double? = nil, bestOf: Int? = nil, logitBias: [String : Int]? = nil, user: String? = nil) {
			self.model = model
			self.prompt = prompt
			self.suffix = suffix
			self.maxTokens = maxTokens
			self.temperature = temperature
			self.topP = topP
			self.n = n
			self.stream = stream
			self.logprobs = logprobs
			self.echo = echo
			self.stop = stop
			self.presencePenalty = presencePenalty
			self.frequencyPenalty = frequencyPenalty
			self.bestOf = bestOf
			self.logitBias = logitBias
			self.user = user
		}
		
		public var model: String
		public var prompt: String
		public var suffix: String?
		public var maxTokens: Int?
		public var temperature: Double?
		public var topP: Double?
		public var n: Int?
		public var stream: Bool?
		public var logprobs: Int?
		public var echo: Bool?
		public var stop: String?
		public var presencePenalty: Double?
		public var frequencyPenalty: Double?
		public var bestOf: Int?
		public var logitBias: [String:Int]?
		public var user: String?
		
		enum CodingKeys: String, CodingKey {
			case model
			case prompt
			case suffix
			case maxTokens = "max_tokens"
			case temperature
			case topP = "top_p"
			case n
			case stream
			case logprobs
			case echo
			case stop
			case presencePenalty = "presence_penalty"
			case frequencyPenalty = "frequency_penalty"
			case bestOf = "best_of"
			case logitBias = "logit_bias"
			case user
		}
	}
	
	// MARK: - CompletionResponse
	public struct CompletionResponse: Codable, Equatable {
		public var id: String
		public var object: String
		public var created: Int
		public var model: String
		public var choices: [CompletionChoice]
		public var usage: CompletionUsage
		
		enum CodingKeys: String, CodingKey {
			case id = "id"
			case object = "object"
			case created = "created"
			case model = "model"
			case choices = "choices"
			case usage = "usage"
		}
		
		public init(id: String, object: String, created: Int, model: String, choices: [CompletionChoice], usage: CompletionUsage) {
			self.id = id
			self.object = object
			self.created = created
			self.model = model
			self.choices = choices
			self.usage = usage
		}
	}
	
	//
	// Hashable or Equatable:
	// The compiler will not be able to synthesize the implementation of Hashable or Equatable
	// for types that require the use of JSONAny, nor will the implementation of Hashable be
	// synthesized for types that have collections (such as arrays or dictionaries).
	
	// MARK: - CompletionChoice
	public struct CompletionChoice: Codable, Equatable {
		public var text: String
		public var index: Int
		public var finishReason: String
		
		enum CodingKeys: String, CodingKey {
			case text = "text"
			case index = "index"
			case finishReason = "finish_reason"
		}
		
		public init(text: String, index: Int, finishReason: String) {
			self.text = text
			self.index = index
			self.finishReason = finishReason
		}
	}
	
	//
	// Hashable or Equatable:
	// The compiler will not be able to synthesize the implementation of Hashable or Equatable
	// for types that require the use of JSONAny, nor will the implementation of Hashable be
	// synthesized for types that have collections (such as arrays or dictionaries).
	
	// MARK: - CompletionUsage
	public struct CompletionUsage: Codable, Equatable {
		public var promptTokens: Int
		public var completionTokens: Int
		public var totalTokens: Int
		
		enum CodingKeys: String, CodingKey {
			case promptTokens = "prompt_tokens"
			case completionTokens = "completion_tokens"
			case totalTokens = "total_tokens"
		}
		
		public init(promptTokens: Int, completionTokens: Int, totalTokens: Int) {
			self.promptTokens = promptTokens
			self.completionTokens = completionTokens
			self.totalTokens = totalTokens
		}
	}
}
