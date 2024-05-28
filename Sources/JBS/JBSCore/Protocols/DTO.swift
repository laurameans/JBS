//
//  DTO.swift
//
//
//  Created by Justin Means on 10/15/23.
//

import Foundation
@_exported import JCX
@_exported import Collections

public protocol DTO: Codable, Equatable, Hashable, Sendable {}
