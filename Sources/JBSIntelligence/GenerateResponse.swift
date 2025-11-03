//
//  GenerateResponse.swift
//  JBSIntelligence
//
//  Created by Justin Means on 2/22/25.
//

import Foundation
import JBS

@PublicInit
public struct GenerateResponse: DTO, Sendable {
    public var message: ChatMessage
    public var model: String
    public var usage: Usage?

    @PublicInit
    public struct Usage: DTO, Sendable {
        public var promptTokens: Int
        public var completionTokens: Int
        public var totalTokens: Int
    }
}
