//
//  Resolution.swift
//
//
//  Created by Justin Means on 12/15/21.
//

import Foundation

@PublicInit
public struct Resolution<User: MicroUserRepresentable>: Codable, Hashable {
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
