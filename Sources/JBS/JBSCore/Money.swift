//
//  Money.swift
//
//
//  Created by Justin Means on 11/3/25.
//

import Foundation

public struct Money: Codable, Hashable, Sendable, Comparable {
    public let cents: Int

    public init(cents: Int) {
        self.cents = cents
    }

    public init?(_ string: String) {
        let cleaned = string.replacingOccurrences(of: "$", with: "")
            .replacingOccurrences(of: ",", with: "")
            .trimmingCharacters(in: .whitespaces)

        guard let decimal = Decimal(string: cleaned) else {
            return nil
        }

        let centsDecimal = decimal * Decimal(100)
        let roundedDecimal = (centsDecimal as NSDecimalNumber).rounding(accordingToBehavior: nil)
        self.cents = roundedDecimal.intValue
    }

    public var formatted: String {
        let isNegative = cents < 0
        let absCents = abs(cents)
        let dollarPart = absCents / 100
        let centsPart = absCents % 100
        return String(format: "%@%d.%02d", isNegative ? "-$" : "$", dollarPart, centsPart)
    }

    public static func + (lhs: Money, rhs: Money) -> Money {
        Money(cents: lhs.cents + rhs.cents)
    }

    public static func - (lhs: Money, rhs: Money) -> Money {
        Money(cents: lhs.cents - rhs.cents)
    }

    public static func * (lhs: Money, rhs: Int) -> Money {
        Money(cents: lhs.cents * rhs)
    }

    public static func < (lhs: Money, rhs: Money) -> Bool {
        lhs.cents < rhs.cents
    }

    public static var zero: Money {
        Money(cents: 0)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let dollarPart = cents / 100
        let centsPart = abs(cents) % 100
        try container.encode(String(format: "%d.%02d", dollarPart, centsPart))
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let string: String
        if let str = try? container.decode(String.self) {
            string = str
        } else if let num = try? container.decode(Double.self) {
            string = String(format: "%.2f", num)
        } else if let num = try? container.decode(Int.self) {
            string = String(format: "%.2f", Double(num))
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Expected String, Double, or Int for Money value"
            )
        }

        guard let money = Money(string) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid money format: \(string)"
            )
        }

        self = money
    }
}
