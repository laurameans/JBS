//
//  File.swift
//  
//
//  Created by Justin Means on 5/4/22.
//

import Foundation

public struct Message {
	public struct Global: Codable, Hashable {
		public init(id: UUID? = nil, subject: String, body: String, imageURL: String? = nil, senderLabel: String? = nil, senderImageURL: String? = nil, type: MessageType, viewed: Bool, createdDate: Date? = nil, actions: MessageActions) {
			self.id = id
			self.subject = subject
			self.body = body
			self.imageURL = imageURL
			self.senderLabel = senderLabel
			self.senderImageURL = senderImageURL
			self.type = type
			self.viewed = viewed
			self.createdDate = createdDate
			self.actions = actions
		}
		
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
	
	public struct Create: Codable, Hashable {
		public init(subject: String, body: String, imageURL: String? = nil, senderLabel: String? = nil, senderImageURL: String? = nil, type: MessageType, actions: MessageActions, associatedID: UUID? = nil) {
			self.subject = subject
			self.body = body
			self.imageURL = imageURL
			self.senderLabel = senderLabel
			self.senderImageURL = senderImageURL
			self.type = type
			self.actions = actions
			self.associatedID = associatedID
		}
		
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

public struct MessageClientResponse: Codable, Equatable, Sendable, Hashable {
	public init(action: MessageAction, type: MessageType, messageID: UUID) {
		self.action = action
		self.type = type
		self.messageID = messageID
	}
	
	public var action: MessageAction
	public var type: MessageType
	public var messageID: UUID
}

public struct MessageServerResponse: Codable, Equatable, Sendable, Hashable {
	public init(associatedID: UUID? = nil, action: MessageAction, type: MessageType) {
		self.associatedID = associatedID
		self.action = action
		self.type = type
	}
	
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
