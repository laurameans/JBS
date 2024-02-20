//
//  JBSUser.swift
//
//
//  Created by Justin Means on 6/10/22.
//

import Foundation

public enum JBSUser {
    @PublicInit
    public struct Micro: MicroUserRepresentable {
        public var id: UUID?
        public var name: String?
        public var username: String?
        public var profilePicURL: String?
    }
}
