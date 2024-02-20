//
//  Int + Extensions.swift
//
//
//  Created by Justin Means on 7/13/22.
//

import Foundation

public extension Int {
    var byteCountFormatted: String {
        let bcf = ByteCountFormatter()
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(self))
        return string
    }

    func byteCountFormattedComponents() -> (value: Double, label: String) {
        let valueFormatter = ByteCountFormatter()
        let labelFormatter = ByteCountFormatter()
        valueFormatter.countStyle = .file
        labelFormatter.countStyle = .file
        valueFormatter.includesUnit = false
        labelFormatter.includesCount = false

        return (value: Double(valueFormatter.string(fromByteCount: Int64(self))) ?? 0, label: labelFormatter.string(fromByteCount: Int64(self)))
    }
}
