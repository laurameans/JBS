//
//  Duplicatable.swift
//
//
//  Created by Justin Means on 10/23/23.
//

import Foundation

public protocol Duplicatable {
    var id: UUID { get set }
}

public extension Duplicatable {
    func duplicate() -> Self {
        var s = self
        s.id = UUID()
        return s
    }
}
