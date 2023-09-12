//
//  File.swift
//  
//
//  Created by Justin Means on 12/28/21.
//

import Foundation

public extension Data {
	var prettyJSON: String? {
		guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
			  let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
			  let prettyPrintedString = String(data: data, encoding:.utf8) else { return nil }
		
		return prettyPrintedString
	}
}

public extension String {
	var prettyJSON: String? {
		return self.data(using: .utf8)?.prettyJSON
	}
}

//public extension Optional where Wrapped == String {
//	var unwrapped: String {
//		return self ?? ""
//	}
//}
