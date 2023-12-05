//
//  File.swift
//  
//
//  Created by Justin Means on 10/21/23.
//

import Foundation

public struct PMIssue {
    
    @PublicInit
    public struct Micro: DTO {
        public var title: String
        public var description: String?
        public var createdDate: Date?
        public var updatedDate: Date?
        public var dueDate: Date?
        public var priority: PMPriority?
        public var labels: [String]
        public var status: PMStatus = .todo
        public var incID: Int?
        public var id: UUID?
        public var url: String?
        public var isPublic: Bool?
        public var externalCreator: Bool?
    }
    
    @PublicInit
    public struct Global: DTO {
        public var micro: PMIssue.Micro
        public var parentIssue: PMIssue.Micro?
        public var subIssues: [PMIssue.Micro]?
        public var assignee: MainframeUserRepresentable.Micro?
        public var creator: MainframeUserRepresentable.Micro?
        public var activity: [PMActivity]?
    }
}
