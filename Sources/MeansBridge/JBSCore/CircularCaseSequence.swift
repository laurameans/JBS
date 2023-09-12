//
//  File.swift
//
//
//  Created by Justin Means on 12/20/21.
//

import Foundation

public protocol CircularCaseSequence: CaseIterable, Sequence, IteratorProtocol, Equatable, Sendable {
	
}

public extension CircularCaseSequence {
	mutating func next() -> Self? {
		self = offset(by: 1)
		return self
	}
	
	mutating func previous() -> Self? {
		self = offset(by: -1)
		return self
	}
}

public extension CaseIterable where Self: Equatable {
	/// Another case from `allCases`.
	///
	/// Circularly wraps `offset` to always provide an element,
	/// even when the resulting `index` is not valid.
	func offset(by offset: Int) -> Self {
		Self.allCases[self, moduloOffset: offset]!
	}
}

public extension Collection where Element: Equatable {
	/// Circularly wraps `index`, to always provide an element,
	/// even when `index` is not valid.
	subscript(
		_ element: Element,
		moduloOffset offset: Int
	) -> Element? {
		firstIndex(of: element).map {
			self[modulo: index($0, offsetBy: offset)]
		}
	}
}

public extension Collection {
	/// Circularly wraps `index`, to always provide an element,
	/// even when `index` is not valid.
	subscript(modulo index: Index) -> Element {
		self[
			self.index(
				startIndex,
				offsetBy:
					distance(from: startIndex, to: index)
					.modulo(count)
			)
		]
	}
}

public extension BinaryInteger {
	func modulo(_ divisor: Self) -> Self {
		let remainder = self % divisor
		return remainder >= 0 ? remainder : remainder + divisor
	}
}
