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
	
	public var message: String {
		switch self {
		case .custom(let text):
			return text
		case .noID:
			return "No ID was found."
		}
	}
}
