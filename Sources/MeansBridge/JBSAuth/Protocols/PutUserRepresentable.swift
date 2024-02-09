//
//  File.swift
//  
//
//  Created by Justin Means on 2/9/24.
//

import Foundation

public protocol PutUserRepresentable: Codable, Hashable {
    associatedtype Personal: PersonalUserRepresentable
    var personal: Personal { get set }
    var password: String? { get set }
    
    init(personal: Personal, password: String?)
}
