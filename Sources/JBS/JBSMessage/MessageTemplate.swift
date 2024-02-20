//
//  MessageTemplate.swift
//
//
//  Created by Justin Means on 4/4/23.
//

import Foundation

public protocol MessageTemplate {
    static var id: Int { get }
    var subject: String? { get set }
    var body: String? { get set }
    var footer: String? { get set }
}
