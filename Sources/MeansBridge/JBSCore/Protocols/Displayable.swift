//
//  File.swift
//  
//
//  Created by Justin Means on 11/14/23.
//

import Foundation

public protocol Displayable {
    var display: KeyValuePairs<String, String> { get }
}

public extension String {
    var camelWords: String {
        return unicodeScalars.dropFirst().reduce(String(prefix(1))) {
            return CharacterSet.uppercaseLetters.contains($1)
            ? $0 + " " + String($1).uppercased()
            : $0 + String($1).uppercased()
        }
    }
}
