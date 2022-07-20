//
//  File.swift
//  
//
//  Created by Justin Means on 12/27/21.
//

import Foundation

public enum RelationshipStatus: StringLiteralType, RawRepresentable, Codable {
	case following
	case blocked
	case muted
	case suspended
	case banned
	case none
	
	public var isRestricted: Bool {
		switch self {
			case .banned, .suspended: return true
			default: return false
		}
	}
	
	public var isFollowing: Bool {
		switch self {
			case .following:
				return true
			default: return false
		}
	}
	
	public var shouldHide: Bool {
		switch self {
			case .blocked: return true
			default: return false
		}
	}
	
	public var data: Data? {
//		return self.rawValue.data(using: .utf8)
		return try? JSONEncoder().encode(self)
	}
}
