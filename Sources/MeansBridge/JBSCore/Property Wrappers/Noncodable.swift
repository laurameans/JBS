//
//  File.swift
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
		self.value = wrappedValue
	}
	public var wrappedValue: Value? {
		get { value }
		set { self.value = newValue }
	}
}
extension NonCodable: Codable, Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.finalize()
	}
	public static func == (lhs: NonCodable<Value>, rhs: NonCodable<Value>) -> Bool {
		return true
	}
	
	public func encode(to encoder: Encoder) throws {
		// Skip encoding the wrapped value.
	}
	public init(from decoder: Decoder) throws {
		// The wrapped value is simply initialised to nil when decoded.
		self.value = nil
	}
}
