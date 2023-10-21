//
//  File.swift
//  
//
//  Created by Justin Means on 10/21/23.
//

import Foundation

public struct PMIssue {
    public struct Micro: DTO {
        public var title: String
        public var description: String
        public var createdDate: Date?
        public var updatedDate: Date?
        public var dueDate: Date?
        public var priority: PMPriority?
    }
    
    public struct Global: DTO {
        public var micro: PMIssue.Micro
        public var parentIssue: PMIssue.Micro?
        public var subIssues: [PMIssue.Micro]?
    }
}
