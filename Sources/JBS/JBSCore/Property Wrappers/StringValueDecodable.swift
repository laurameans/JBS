//
//  StringValueDecodable.swift
//
//
//  Created by Justin Means on 10/6/22.
//

import Foundation

@propertyWrapper
public struct StringValueDecodable<T: Codable & Hashable & StringInitable & Sendable>: Codable, Hashable, Sendable {
    public init(precision: Precision = .original, wrappedValue: T?) {
        self.wrappedValue = wrappedValue
        self.precision = precision
    }

    public init(precision: Precision = .original) {
        self.precision = precision
    }

    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()

            do {
                wrappedValue = try container.decode(T?.self)
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
            wrappedValue = nil
        }
    }

    public enum Precision: DTO {
        case original
        case twoPoint
        case integer
    }

    public var wrappedValue: T?
    public var precision: Precision = .original

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case let floatValue as Float:
            switch precision {
            case .original:
                try container.encode(floatValue)
            case .twoPoint:
                let formattedString = String(format: "%.2f", floatValue)
                try container.encode(formattedString)
            case .integer:
                let formattedString = String(format: "%.0f", floatValue)
                try container.encode(formattedString)
            }

        case let decimalValue as Decimal:
            switch precision {
            case .original:
                try container.encode(decimalValue)
            case .twoPoint:
                let formattedString = decimalValue.formattedString(withFractionDigits: 2)
                try container.encode(formattedString)
            case .integer:
                let formattedString = decimalValue.formattedString(withFractionDigits: 0)
                try container.encode(formattedString)
            }

        default:
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
        self.init(string: string, locale: Locale(identifier: "en_US_POSIX"))
    }
}

public extension Decimal {
    func formattedString(withFractionDigits fractionDigits: Int) -> String {
        // Convert Decimal to String with default formatting.
        var stringRepresentation = "\(self)"

        // Find the location of the decimal point.
        if let decimalPointIndex = stringRepresentation.firstIndex(of: ".") {
            let fractionalPartStartIndex = stringRepresentation.index(after: decimalPointIndex)
            let fractionalPartLength = stringRepresentation.distance(from: fractionalPartStartIndex, to: stringRepresentation.endIndex)

            if fractionDigits > fractionalPartLength {
                // Append zeros if the number of fraction digits is greater than the length of fractional part.
                stringRepresentation += String(repeating: "0", count: fractionDigits - fractionalPartLength)
            } else if fractionDigits < fractionalPartLength {
                // Truncate if the number of fraction digits is less than the length of fractional part.
                let endIndexOfFraction = stringRepresentation.index(fractionalPartStartIndex, offsetBy: fractionDigits)
                stringRepresentation = String(stringRepresentation[..<endIndexOfFraction])
            }
        } else if fractionDigits > 0 {
            // Append decimal point and zeros if there's no fractional part.
            stringRepresentation += "." + String(repeating: "0", count: fractionDigits)
        }

        return stringRepresentation
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
