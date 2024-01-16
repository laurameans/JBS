//
//  File.swift
//  
//
//  Created by Justin Means on 1/15/24.
//

import Foundation

public enum AccessLevel: String, DTO, CaseIterable {
    case `internal`
    case confidential
    case restricted
}
