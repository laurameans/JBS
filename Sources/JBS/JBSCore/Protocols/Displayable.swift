//
//  Displayable.swift
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
        guard !isEmpty else { return self }

        return unicodeScalars.reduce(into: "") { result, scalar in
            if CharacterSet.uppercaseLetters.contains(scalar) {
                result += " " + String(scalar).capitalizingFirstLetter()
            } else {
                result += String(scalar)
            }
        }.capitalizingFirstLetter()
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}
