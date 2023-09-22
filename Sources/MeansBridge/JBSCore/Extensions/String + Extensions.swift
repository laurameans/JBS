//
//  File.swift
//  
//
//  Created by Justin Means on 7/3/22.
//

import Foundation

fileprivate let badChars = CharacterSet.alphanumerics.inverted

public extension String {
	var uppercasingFirst: String {
		return prefix(1).uppercased() + dropFirst()
	}
	
	var lowercasingFirst: String {
		return prefix(1).lowercased() + dropFirst()
	}
	
	var camelized: String {
		guard !isEmpty else {
			return ""
		}
		
		let parts = self.components(separatedBy: badChars)
		
		let first = String(describing: parts.first!).lowercasingFirst
		let rest = parts.dropFirst().map({String($0).uppercasingFirst})
		
		return ([first] + rest).joined(separator: "")
	}
	
	#if canImport(UIKit) || canImport(AppKit)
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
#endif
    
    func formatPhoneNumber() -> String {
        guard self.count == 10 else { return self }
        let areaCode = self.prefix(3)
        let middle = self.dropFirst(3).prefix(3)
        let last = self.dropFirst(6)
        return "(\(areaCode)) \(middle)-\(last)"
    }
}
