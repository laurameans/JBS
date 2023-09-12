//
//  File.swift
//  
//
//  Created by Justin Means on 12/15/21.
//

import Foundation

public struct Resolution<User: MicroUserRepresentable>: Codable, Hashable {
	public init(resolutionType: ResolutionType, resolvedBy: User, additionalComments: String? = nil) {
		self.resolutionType = resolutionType
		self.resolvedBy = resolvedBy
		self.additionalComments = additionalComments
	}
	
	public var resolutionType: ResolutionType
	public var resolvedBy: User
	public var additionalComments: String?
}

public enum ResolutionType: Codable, CodingKey {
	case noAction
	case contentRemoved
	case contentHidden
	case userSuspended
	case userBanned
}
