//
//  File.swift
//  
//
//  Created by Justin Means on 12/8/22.
//

import Foundation
import JBS

public protocol Swizzle: Codable, RawRepresentable, Hashable, CircularCaseSequence {
	var nickName: String { get }
	var text: String { get }
}
