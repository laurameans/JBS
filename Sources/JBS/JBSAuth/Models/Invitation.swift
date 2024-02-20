//
//  Invitation.swift
//
//
//  Created by Justin Means on 5/4/22.
//

import Foundation

public enum Invitation {
    public enum Outreach: Codable, Hashable {
        case user(_ userID: UUID)
        case email(_ email: String)
    }
}

public extension MessageType {
    static var invitation: MessageType {
        MessageType(rawValue: "invitation")
    }
}

public struct InvitationType: RawRepresentable, Equatable, Sendable, Codable, Hashable {
    public var rawValue: String
    public typealias RawValue = String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
