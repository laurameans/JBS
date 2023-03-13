//
//  File.swift
//  
//
//  Created by Justin Means on 7/20/22.
//

import Foundation

public enum JBSError: Error {
	case custom(_ text: String)
	case noID
	case badURL
	case invalidPassword
	case invalidEmail
	case usernameUnavailable
	
	public var message: String {
		switch self {
		case .custom(let text):
			return text
		case .noID:
			return "No ID was found."
		case .badURL:
			return "URL could not be parsed."
			case .invalidEmail:
				return "Invalid Email"
			case .invalidPassword:
				return "Invalid Password"
			case .usernameUnavailable:
				return "Username Unavailable"
		}
	}
}
