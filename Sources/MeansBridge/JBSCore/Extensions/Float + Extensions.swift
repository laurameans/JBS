//
//  File.swift
//  
//
//  Created by Justin Means on 2/18/24.
//

import Foundation

public extension Float {
    func roundedString(_ digits: Int) -> String {
        return String(format: "%.\(digits)f", self)
    }
    var metersToInches: String {
        let metersToInchesFactor = Double(39.3701)
        let dimTotalInches = Double(self) * metersToInchesFactor
        guard !dimTotalInches.isInfinite && !dimTotalInches.isNaN else { return "" }
        let feet = Int(dimTotalInches / 12)
        let inches = Int(dimTotalInches.rounded()) % 12
        
        return "\(feet)' \(inches)''"
    }
}
