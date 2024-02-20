//
//  Message.swift
//
//
//  Created by Justin Means on 5/4/22.
//

import Foundation

public enum Message {
    @PublicInit
    public struct Global: Codable, Hashable {
        public var id: UUID?
        public var subject: String
        public var body: String
        public var imageURL: String?
        public var senderLabel: String?
        public var senderImageURL: String?
        public var type: MessageType
        public var viewed: Bool
        public var createdDate: Date?
        public var actions: MessageActions
    }

    @PublicInit
    public struct Create: Codable, Hashable {
        public var subject: String
        public var body: String
        public var imageURL: String?
        public var senderLabel: String?
        public var senderImageURL: String?
        public var type: MessageType
        public var actions: MessageActions
        public var associatedID: UUID?
    }
}

public struct MessageType: RawRepresentable, Equatable, Sendable, Codable, Hashable {
    public var rawValue: String
    public typealias RawValue = String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public typealias MessageActions = [MessageAction]

@PublicInit
public struct MessageClientResponse: Codable, Equatable, Sendable, Hashable {
    public var action: MessageAction
    public var type: MessageType
    public var messageID: UUID
}

@PublicInit
public struct MessageServerResponse: Codable, Equatable, Sendable, Hashable {
    public var associatedID: UUID?
    public var action: MessageAction
    public var type: MessageType
}

public struct MessageAction: RawRepresentable, Equatable, Sendable, Codable, Hashable {
    public var rawValue: String
    public typealias RawValue = String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension MessageAction {
    static var accept: MessageAction {
        MessageAction(rawValue: "accept")
    }

    static var decline: MessageAction {
        MessageAction(rawValue: "decline")
    }
}
