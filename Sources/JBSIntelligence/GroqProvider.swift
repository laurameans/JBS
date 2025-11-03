//
//  GroqProvider.swift
//  JBSIntelligence
//
//  Created by Justin Means on 2/22/25.
//

import AnyLanguageModel
import Foundation

public struct GroqProvider: LanguageModel {
    public typealias UnavailableReason = Never

    private let openAIModel: OpenAILanguageModel

    public init(apiKey: String, model: String = "kimi-k2-instruct") {
        self.openAIModel = OpenAILanguageModel(
            baseURL: URL(string: "https://api.groq.com/openai/v1")!,
            apiKey: apiKey,
            model: model,
            apiVariant: .chatCompletions
        )
    }

    public func respond<Content>(
        within session: LanguageModelSession,
        to prompt: Prompt,
        generating type: Content.Type,
        includeSchemaInPrompt: Bool,
        options: GenerationOptions
    ) async throws -> LanguageModelSession.Response<Content> where Content: Generable {
        try await openAIModel.respond(
            within: session,
            to: prompt,
            generating: type,
            includeSchemaInPrompt: includeSchemaInPrompt,
            options: options
        )
    }

    public func streamResponse<Content>(
        within session: LanguageModelSession,
        to prompt: Prompt,
        generating type: Content.Type,
        includeSchemaInPrompt: Bool,
        options: GenerationOptions
    ) -> sending LanguageModelSession.ResponseStream<Content> where Content: Generable {
        openAIModel.streamResponse(
            within: session,
            to: prompt,
            generating: type,
            includeSchemaInPrompt: includeSchemaInPrompt,
            options: options
        )
    }
}
