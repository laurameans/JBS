//
//  File.swift
//  
//
//  Created by Justin Means on 11/24/21.
//

import Foundation

public struct AuthPasswordCodeRequest: Codable {
	public init(email: String) {
		self.email = email
	}
	
	public var email: String
}
