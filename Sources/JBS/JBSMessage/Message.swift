//
//  Message.swift
//
//
//  Created by Justin Means on 5/4/22.
//

import Foundation
import APNSCore

@PublicInit
public struct Message: DTO {
    public init(title: String?, subtitle: String?, body: String?, imageURL: String? = nil, senderLabel: String? = nil, senderImageURL: String? = nil, type: MessageType = .notification, viewed: Bool = false, createdDate: Date? = nil, actions: MessageActions = [], priority: Priority? = nil) {
        id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.body = body
        self.imageURL = imageURL
        self.senderLabel = senderLabel
        self.senderImageURL = senderImageURL
        self.type = type
        self.viewed = viewed
        self.createdDate = createdDate
        self.actions = actions
        self.priority = priority ?? .passive
    }

    public var id: UUID?
    public var title: String?
    public var subtitle: String?
    public var body: String?
    public var imageURL: String?
    public var senderLabel: String?
    public var senderImageURL: String?
    public var type: MessageType
    public var viewed: Bool
    public var createdDate: Date?
    public var actions: MessageActions
    public var associatedID: UUID?
    public var priority: Priority
    
    public enum Priority: String, DTO {
        /// The system adds the notification to the notification list without lighting up the screen or playing a sound.
        case passive = "passive"
        /// The system presents the notification immediately, lights up the screen, and can play a sound.
        case active = "active"
        /// The system presents the notification immediately, lights up the screen, and can play a sound,
        /// but won’t break through system notification controls.
        case timeSensitive = "time-sensitive"
        /// The system presents the notification immediately, lights up the screen, and bypasses the mute switch to play a sound.
        case critical = "critical"
    }
}

public struct MessageType: RawRepresentable, Equatable, Sendable, Codable, Hashable {
    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public typealias RawValue = String

    public var rawValue: String
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
    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public typealias RawValue = String

    public var rawValue: String
}

public extension MessageAction {
    static var accept: MessageAction {
        MessageAction(rawValue: "accept")
    }

    static var decline: MessageAction {
        MessageAction(rawValue: "decline")
    }
}

public extension MessageType {
    static var notification: MessageType {
        MessageType(rawValue: "notification")
    }
}
