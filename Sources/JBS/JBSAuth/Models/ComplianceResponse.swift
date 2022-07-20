//
//  File.swift
//  
//
//  Created by Justin Means on 12/29/21.
//

import Foundation

public struct ComplianceResponse: Codable, Equatable, Sendable, Hashable {
	public init(pdfURL: String, webURL: String, title: String, effectiveDate: String) {
		self.pdfURL = pdfURL
		self.webURL = webURL
		self.title = title
		self.effectiveDate = effectiveDate
	}
	
	public var pdfURL: String
	public var webURL: String
	public var title: String
	public var effectiveDate: String
}

public extension ComplianceResponse {
	static var preview: ComplianceResponse {
		ComplianceResponse(pdfURL: "https://cdn.voosey.com/company/compliance/Voosey%20Terms%20and%20Conditions.pdf", webURL: "https://voosey.com/terms", title: "Terms and Conditions", effectiveDate: "December 30, 2021")
	}
}
