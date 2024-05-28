//
//  SIWARequest.swift
//
//
//  Created by Justin Means on 2/9/24.
//

import Foundation
import JCX

@PublicInit
public struct SIWARequest: DTO {
    public var firstName: String?
    public var lastName: String?
    public var fullName: String?
    public var email: String?
    public var appleIdentityToken: String
    public var hardware: Hardware?
}
