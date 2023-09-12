//
//  File.swift
//  
//
//  Created by Justin Means on 11/24/21.
//

import Foundation

public struct AuthPasswordResetRequest: Codable {
	public init(email: String, code: String, newPassword: String) {
		self.email = email
		self.code = code
		self.newPassword = newPassword
	}
	
	public var email: String
	public var code: String
	public var newPassword: String
} 
