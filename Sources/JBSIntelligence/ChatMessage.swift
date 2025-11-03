//
//  ChatMessage.swift
//  JBSIntelligence
//
//  Created by Justin Means on 2/22/25.
//

import Foundation
import JBS

@PublicInit
public struct ChatMessage: DTO, Sendable {
    public enum Role: String, DTO, Sendable {
        case system
        case user
        case assistant
        case tool
    }

    public var role: Role
    public var content: String
    public var toolCalls: [ToolCall]?
}

@PublicInit
public struct ToolCall: DTO, Sendable {
    public var id: String
    public var name: String
    public var arguments: String
}
