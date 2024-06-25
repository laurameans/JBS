//
//  JSONDecoder + Extensions.swift
//
//
//  Created by Justin Means on 6/21/24.
//

import Foundation

public extension JSONDecoder {
    static var jbs: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
