//
//  UserModerationAction.swift
//
//
//  Created by Justin Means on 8/14/25.
//

import Foundation

public enum UserModerationAction {
    @PublicInit
    public struct Ban: DTO {
        public var reason: String
    }
    
    @PublicInit
    public struct Suspend: DTO {
        public var reason: String
        public var durationDays: Int = 7
    }
    
    @PublicInit
    public struct Message: DTO {
        public var title: String
        public var body: String
        public var priority: JBS.Message.Priority = .active
    }
}

