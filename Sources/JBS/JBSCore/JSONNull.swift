//
//  JSONNull.swift
//
//
//  Created by Justin Means on 6/17/22.
//

import Foundation

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        
    }
    
    public static func == (_: JSONNull, _: JSONNull) -> Bool {
        return true
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
