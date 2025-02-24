//
//  Loggable.swift
//  JBS
//
//  Created by Justin Means on 2/22/25.
//

import Foundation

public protocol Loggable {
    static var logPrefix: String { get }
}

public extension Loggable {
    nonisolated static func log(_ log: String) {
        print("[\(logPrefix)] \(log)")
    }
}
