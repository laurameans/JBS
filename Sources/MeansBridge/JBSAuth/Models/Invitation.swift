//
//  File.swift
//  
//
//  Created by Justin Means on 5/4/22.
//

import Foundation

public struct Invitation {
//	public struct Create: Codable, Hashable {
//		public init(email: String, message: String? = nil, subject: String, body: String, type: InvitationType) {
//			self.email = email
//			self.message = message
//			self.subject = subject
//			self.body = body
//			self.type = type
////			self.actions = actions
//		}
//
//
//		public var email: String
//		public var message: String?
//		public var subject: String
//		public var body: String
//		public var type: InvitationType
////		public var actions: MessageActions
//	}
	
	public enum Outreach: Codable, Hashable {
		case user(_ userID: UUID)
		case email(_ email: String)
	}
}

//public enum InvitationStatus: String, Codable {
//	case unseen
//	case accepted
//	case rejected
//}

public extension MessageType {
	static var invitation: MessageType {
		MessageType(rawValue: "invitation")
	}
}

//public protocol NotificationActionRepresentable {
//	var acceptAction: (() -> Void)? { get set }
//
//}
//
public struct InvitationType: RawRepresentable, Equatable, Sendable, Codable, Hashable {
	public var rawValue: String
	public typealias RawValue = String

	public init(rawValue: String) {
		self.rawValue = rawValue
	}
}

