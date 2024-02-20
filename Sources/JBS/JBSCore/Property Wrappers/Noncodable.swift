//
//  Noncodable.swift
//
//
//  Created by Justin Means on 3/23/22.
//

import Foundation

/// A property wrapper for properties of a type that should be "skipped" when the type is encoded or decoded.
@propertyWrapper
public struct NonCodable<Value: Sendable>: Sendable {
    private var value: Value?
    public init(wrappedValue: Value?) {
        value = wrappedValue
    }

    public var wrappedValue: Value? {
        get { value }
        set { value = newValue }
    }
}

extension NonCodable: Codable, Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.finalize()
    }

    public static func == (_: NonCodable<Value>, _: NonCodable<Value>) -> Bool {
        return true
    }

    public func encode(to _: Encoder) throws {
        // Skip encoding the wrapped value.
    }

    public init(from _: Decoder) throws {
        // The wrapped value is simply initialised to nil when decoded.
        value = nil
    }
}
