//
//  File.swift
//  
//
//  Created by Justin Means on 11/12/21.
//

import Foundation

public protocol MicroUserRepresentable: Codable, Identifiable, Hashable {
	var id: UUID? { get set }
	var name: String? { get set }
	var username: String { get set }
    var profilePicURL: String? { get set }
}
