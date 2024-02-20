//
//  Dump.swift
//
//
//  Created by Justin Means on 6/17/22.
//

import Foundation

public func dumpToString(_ object: Any) -> String {
    var string = String()
    dump(object, to: &string)
    return string
}
