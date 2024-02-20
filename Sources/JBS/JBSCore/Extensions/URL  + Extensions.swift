//
//  URL  + Extensions.swift
//
//
//  Created by Justin Means on 11/23/22.
//

import Foundation

public extension URL {
    init(_ string: String) throws {
        if let url = URL(string: string) {
            self = url
        } else {
            throw JBSError.badURL
        }
    }
}
