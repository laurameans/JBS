//
//  File.swift
//  
//
//  Created by Justin Means on 1/18/23.
//

import Foundation

public protocol SearchResultRepresentable: Codable, Hashable {
	var title: String { get }
	var subtitle: String? { get }
	var imageURL: String? { get }
	
	
}
