//
//  File.swift
//  
//
//  Created by Justin Means on 11/24/21.
//

import Foundation

public struct AuthDevicePut: Codable {
	public let id: UUID?
	public let pushToken: String?
	public let system: OperatingSystem
	public let osVersion: String
	public let channels: [String]?
	
	public init(id: UUID? = nil, pushToken: String? = nil, system: OperatingSystem, osVersion: String, channels: [String]? = nil) {
		self.id = id
		self.pushToken = pushToken
		self.system = system
		self.osVersion = osVersion
		self.channels = channels
	}
}
