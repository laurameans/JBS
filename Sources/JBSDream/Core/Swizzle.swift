//
//  File.swift
//  
//
//  Created by Justin Means on 12/8/22.
//

import Foundation
import JBS

public protocol Swizzle: Codable, Equatable, Hashable, RawRepresentable, Hashable, CircularCaseSequence {
	var nickName: String { get }
	var text: String { get }
	var negativeText: String? { get }
	static var slug: String { get }
}
