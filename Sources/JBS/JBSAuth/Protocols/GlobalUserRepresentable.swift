//
//  GlobalUserRepresentable.swift
//
//
//  Created by Justin Means on 11/12/21.
//

import Foundation

public protocol GlobalUserRepresentable: DTO, Identifiable {
    associatedtype Micro: MicroUserRepresentable
    var micro: Micro { get set }
    var id: UUID? { get }
    var relationship: RelationshipStatus? { get set }
}

public extension GlobalUserRepresentable {
    var id: UUID? {
        return micro.id
    }
}
