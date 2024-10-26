//
//  Displayable.swift
//
//
//  Created by Justin Means on 11/14/23.
//

import Foundation

// MARK: - Displayable

public protocol Displayable {
    var display: OrderedDictionary<String, String> { get }
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
    
    var titleCase: String {
        guard !isEmpty else { return self }
        
        // Define words that shouldn't be capitalized (unless they're the first word)
        let lowercaseWords = Set(["a", "an", "the", "and", "but", "or", "for", "nor", "in", "of", "on", "at", "to", "by", "with"])
        
        let words = self.lowercased().split(separator: " ")
        var result: [String] = []
        
        for (index, word) in words.enumerated() {
            let wordString = String(word)
            if index == 0 || !lowercaseWords.contains(wordString) {
                result.append(wordString.capitalizingFirstLetter())
            } else {
                result.append(wordString)
            }
        }
        
        return result.joined(separator: " ")
    }
}
