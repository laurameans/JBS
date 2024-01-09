//
//  File.swift
//  
//
//  Created by Justin Means on 12/31/23.
//

import Foundation

@propertyWrapper
public struct Editable<Value>: Sendable & Codable & Hashable & Equatable where Value: Sendable & Codable & Hashable & Equatable {
    public var value: Value
    public var min: Value?
    public var max: Value?
    public var roundingLevel: Int?
    
    public var wrappedValue: Value {
        get { value }
        set { value = newValue }
    }
    
    public init(wrappedValue: Value, min: Value? = nil, max: Value? = nil, roundingLevel: Int? = nil) {
        self.value = wrappedValue
        self.min = min
        self.max = max
        self.roundingLevel = roundingLevel
    }
}

import SwiftUI
public protocol EditableProperty {
    associatedtype Value: Sendable & Codable & Hashable & Equatable
    var value: Value { get set }
}

extension EditableProperty {
    public mutating func updateValue(_ v: Value) {
        self.value = v
    }
}

extension Editable: EditableProperty where Value: Decodable {
    
}
