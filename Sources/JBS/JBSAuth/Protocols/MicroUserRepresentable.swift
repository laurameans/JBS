//
//  MicroUserRepresentable.swift
//
//
//  Created by Justin Means on 11/12/21.
//

import Foundation

public protocol MicroUserRepresentable: DTO, Identifiable {
    var id: UUID? { get set }
    var name: String? { get set }
    var username: String? { get set }
    var profilePicURL: String? { get set }
    var isAnonymous: Bool? { get }
}

public extension MicroUserRepresentable {
    var isAnonymous: Bool? { nil }
}
