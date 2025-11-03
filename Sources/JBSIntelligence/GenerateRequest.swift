//
//  GenerateRequest.swift
//  JBSIntelligence
//
//  Created by Justin Means on 2/22/25.
//

import Foundation
import JBS

@PublicInit
public struct GenerateRequest: DTO, Sendable {
    public var messages: [ChatMessage]
    public var model: String?
    public var temperature: Double?
    public var maxTokens: Int?
}
