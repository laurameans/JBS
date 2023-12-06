//
//  File.swift
//  
//
//  Created by Justin Means on 10/6/22.
//

import Foundation

@propertyWrapper
public struct StringValueDecodable<T: Codable & Hashable & StringInitable & Sendable>: Codable, Hashable, Sendable {
	
	public var wrappedValue: T?
	
	public init(wrappedValue: T?) {
		self.wrappedValue = wrappedValue
	}
	
	public init(from decoder: Decoder) throws {
		do {
			let container = try decoder.singleValueContainer()
			
			do {
				self.wrappedValue = try container.decode(T?.self)
			} catch let underlyingError {
				do {
					let stringValue = try container.decode(String?.self)
					guard let stringValue = stringValue, let decimalValue = T(string: stringValue) else {
						self.wrappedValue = nil
						return
					}
					self.wrappedValue = decimalValue
				} catch let underlyingError {
					self.wrappedValue = nil
				}
			}
		} catch {
			self.wrappedValue = nil
		}
	}
	
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let floatValue = wrappedValue as? Float {
            let formattedString = String(format: "%.2f", floatValue)
            try container.encode(formattedString)
        } else {
            try container.encode(wrappedValue)
        }
    }
	
}

public enum StringInitableError: Error {
	case stringIsNonGenericType(underlyingError: Error)
}

public protocol StringInitable {
	init?(string: String)
}

extension Decimal: StringInitable {
	public init?(string: String) {
		self.init(string: string, locale: nil)
	}
}

extension Float: StringInitable {
    public init?(string: String) {
        guard let number = NumberFormatter().number(from: string) else { return nil }
        self = number.floatValue
    }
}

extension Int: StringInitable {
	public init?(string: String) {
		self.init(string)
	}
}
