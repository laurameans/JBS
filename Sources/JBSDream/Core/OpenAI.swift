//
//  OpenAI.swift
//
//
//  Created by Justin Means on 2/11/23.
//

import Foundation
import JBS

public enum OpenAI {
    @PublicInit
    public struct AuthenticatedChatRequest: Codable {
        public var request: ChatRequest
        public var key: String
    }

    @PublicInit
    public struct UserChatRequest: Codable {
        public var request: ChatRequest
        public var createdDate: Date
        public var title: String?
        public var id: UUID
    }

    @PublicInit
    public struct ChatRequest: Codable {
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

    @PublicInit
    public struct ChatResponse: Codable {
        public var id: String
        public var object: String
        public var created: Date
        public var choices: [ChatChoice]
        public var usage: ChatUsage
    }

    @PublicInit
    public struct ChatUsage: Codable {
        public var promptTokens: Int
        public var completionTokens: Int
        public var totalTokens: Int
    }

    @PublicInit
    public struct ChatChoice: Codable {
        public var index: Int
        public var message: ChatMessage
        public var finishReason: String?
    }

    @PublicInit
    public struct ChatMessage: Codable, Hashable {
        public enum Role: String, RawRepresentable, Codable {
            case system
            case assistant
            case user
        }

        public var role: Role
        public var content: String
    }

    @PublicInit
    public struct CompletionRequest: Codable {
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
        public var logitBias: [String: Int]?
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

    @PublicInit
    public struct CompletionResponse: Codable, Equatable {
        public var id: String
        public var object: String
        public var created: Int
        public var model: String
        public var choices: [CompletionChoice]
        public var usage: CompletionUsage
    }

    //
    // Hashable or Equatable:
    // The compiler will not be able to synthesize the implementation of Hashable or Equatable
    // for types that require the use of JSONAny, nor will the implementation of Hashable be
    // synthesized for types that have collections (such as arrays or dictionaries).

    // MARK: - CompletionChoice

    @PublicInit
    public struct CompletionChoice: Codable, Equatable {
        public var text: String
        public var index: Int
        public var finishReason: String

        enum CodingKeys: String, CodingKey {
            case text
            case index
            case finishReason = "finish_reason"
        }
    }

    //
    // Hashable or Equatable:
    // The compiler will not be able to synthesize the implementation of Hashable or Equatable
    // for types that require the use of JSONAny, nor will the implementation of Hashable be
    // synthesized for types that have collections (such as arrays or dictionaries).

    // MARK: - CompletionUsage

    @PublicInit
    public struct CompletionUsage: Codable, Equatable {
        public var promptTokens: Int
        public var completionTokens: Int
        public var totalTokens: Int

        enum CodingKeys: String, CodingKey {
            case promptTokens = "prompt_tokens"
            case completionTokens = "completion_tokens"
            case totalTokens = "total_tokens"
        }
    }

    public static var encoder: JSONEncoder {
        let e = JSONEncoder()
        e.dateEncodingStrategy = .iso8601
        e.keyEncodingStrategy = .convertToSnakeCase
        return e
    }
}
