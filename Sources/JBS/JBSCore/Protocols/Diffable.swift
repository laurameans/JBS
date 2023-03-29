//
//  File.swift
//  
//
//  Created by Justin Means on 3/27/23.
//

import Foundation

public protocol Diffable {
	
}

public extension Diffable where Self: Equatable {
	static func == (lhs: Self, rhs: Self) -> Bool {
		return lhs.diff(with: rhs).isEmpty
	}
	
	func diff(with other: Self) -> [String: Any] {
		let mirror1 = Mirror(reflecting: self)
		let mirror2 = Mirror(reflecting: other)
		
		var differences: [String: Any] = [:]
		
		for (label1, value1) in mirror1.children {
			for (label2, value2) in mirror2.children {
				if label1 == label2, !isEqual(value1, value2) {
					differences[label1!] = value2
				}
			}
		}
		
		return differences
	}
	
	private func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
		let lhsMirror = Mirror(reflecting: lhs)
		let rhsMirror = Mirror(reflecting: rhs)
		
		if lhsMirror.displayStyle == .optional, lhsMirror.children.isEmpty {
			return rhsMirror.displayStyle == .optional && rhsMirror.children.isEmpty
		}
		
		return lhs as? AnyHashable == rhs as? AnyHashable
	}
}
