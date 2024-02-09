//
//  File.swift
//
//
//  Created by Justin Means on 7/20/22.
//

import Foundation

public enum MeansBridgeError: Error {
    case custom(_ text: String)
    case noID
    case badURL
    case invalidPassword
    case invalidEmail
    case usernameUnavailable
    case siwaEmailMissing
    case siwaInvalidState
    case noUsername
    
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
            case .siwaEmailMissing:
                return "The email is missing from Apple Identity Token. Revoke access for this application on https://appleid.apple.com and try again."
            case .siwaInvalidState:
                return "Invalid state for Sign in With Apple."
            case .noUsername:
                return "Please set up a username."
        }
    }
}
