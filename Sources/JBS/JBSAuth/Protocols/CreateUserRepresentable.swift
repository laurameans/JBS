//
//  File.swift
//  
//
//  Created by Justin Means on 3/11/23.
//

import Foundation

public protocol CreateUserRepresentable: Codable, Hashable {
	var username: String { get set }
	var email: String { get set }
	var name: String { get set }
	var password: String { get set }
	var hasAcceptedTermsAndConditions: Bool { get set }
	var hasAcceptedPrivacyPolicy: Bool { get set }
	
	init()
	
	init(username: String, email: String, name: String, password: String, hasAcceptedTermsAndConditions: Bool, hasAcceptedPrivacyPolicy: Bool)
}
