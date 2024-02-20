//
//  AuthDevicePutRepresentable.swift
//
//
//  Created by Justin Means on 11/24/21.
//

import Foundation

@PublicInit
public struct AuthDevicePut: Codable {
    public let id: UUID?
    public let pushToken: String?
    public let system: OperatingSystem
    public let osVersion: String
    public let channels: [String]?
}
