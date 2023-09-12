//
//  File.swift
//  
//
//  Created by Justin Means on 12/3/22.
//

import Foundation

public protocol DreamPrediction: Codable, Sendable, Hashable, Identifiable {
	associatedtype Create: DreamPredictionCreate
	associatedtype Input: DreamInput
	associatedtype Output
	associatedtype Status: DreamStatus
	var id: ID { get set }
	var idString: String { get }
	var status: Status { get set }
	var input: Input { get set }
	var output: Output? { get set }
	var error: String? { get set }
	var logs: String? { get set }
	static var slug: String { get }
}

public extension DreamPrediction {
	static var inputType: Input.Type {
		Input.self
	}
}

public protocol DreamPredictionCreate: Codable, Hashable, Sendable {
	
}

public protocol DreamInput: Codable, Hashable, Sendable {
	
}

public protocol DreamOutput: Codable, Hashable, Sendable {

}

public protocol DreamStatus: Codable, Hashable, Sendable {
	
}


//public protocol Cashable: Codable, Sendable { }
