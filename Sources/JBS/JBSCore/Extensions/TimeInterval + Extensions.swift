//
//  File.swift
//  
//
//  Created by Justin Means on 2/9/23.
//

import Foundation

public extension TimeInterval {
	var descriptiveString: String {
		let formatter = DateComponentsFormatter()
		formatter.allowedUnits = [.day, .hour, .minute, .second]
		formatter.unitsStyle = .abbreviated
		formatter.maximumUnitCount = 2
		
		return formatter.string(from: self) ?? ""
	}
}
