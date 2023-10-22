//
//  File.swift
//  
//
//  Created by Justin Means on 10/21/23.
//

import Foundation
import MeansCompiler

public struct PMProject {
    @PublicInit
    public struct Micro: DTO {
        public var title: String
        public var slug: String
        public var shortcode: String
        public var isPublic: Bool?
        public var description: String?
        public var dueDate: Date?
        public var startDate: Date?
        public var updatedDate: Date?
        public var createdDate: Date?
        public var color: String?
        public var icon: String?
    }
    @PublicInit
    public struct Global: DTO {
        public var issues: [PMIssue.Micro]
        public var micro: PMProject.Micro
    }
}
