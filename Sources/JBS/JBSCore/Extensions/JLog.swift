//
//  JLog.swift
//  JBS
//
//  Created by Justin Means on 5/23/25.
//

import Foundation

nonisolated(unsafe) public var jlogDate: Date = Date()

public func jlog(_ message: Any) {
    #if DEBUG
    print("[\(String(format: "%.4f", abs(jlogDate.timeIntervalSinceNow)))] \(message)")
    jlogDate = Date()
    #endif
}
