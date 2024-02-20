//
//  AuthPasswordResetRequest.swift
//
//
//  Created by Justin Means on 11/24/21.
//

import Foundation

@PublicInit
public struct AuthPasswordResetRequest: DTO {
    public var email: String
    public var code: String
    public var newPassword: String
}
