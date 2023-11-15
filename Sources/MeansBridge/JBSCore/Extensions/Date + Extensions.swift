//
//  File.swift
//  
//
//  Created by Justin Means on 11/14/23.
//

import Foundation
import SwiftDate

public extension Date {
    func MMMddyyyhhmmssa(_ zone: Zones) -> String {
        DateInRegion(self, region: Region(zone: zone)).toFormat("MMM dd yyyy hh:mm:ss a")
    }
    
    func yyyyMMddhhmmssa(_ zone: Zones) -> String {
        DateInRegion(self, region: Region(zone: zone)).toFormat("yyyy-MM-dd hh:mm:ss a")
    }
}
