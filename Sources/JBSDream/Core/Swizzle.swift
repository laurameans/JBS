//
//  Swizzle.swift
//
//
//  Created by Justin Means on 12/8/22.
//

import Foundation
import JBS

public protocol Swizzle: DTO, RawRepresentable, Hashable, CircularCaseSequence, Equatable {
    var nickName: String { get }
    var text: String { get }
    var negativeText: String? { get }
    static var slug: String { get }
}
