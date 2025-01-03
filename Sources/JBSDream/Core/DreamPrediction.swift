//
//  DreamPrediction.swift
//
//
//  Created by Justin Means on 12/3/22.
//

import Foundation
import JBS

// MARK: - DreamPrediction

public protocol DreamPrediction: DTO, Hashable, Identifiable {
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

// MARK: - DreamPredictionCreate

public protocol DreamPredictionCreate: DTO {}

// MARK: - DreamInput

public protocol DreamInput: DTO {}

// MARK: - DreamOutput

public protocol DreamOutput: DTO {}

// MARK: - DreamStatus

public protocol DreamStatus: DTO {}
