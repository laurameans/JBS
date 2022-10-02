//
//  File.swift
//  
//
//  Created by Justin Means on 9/30/22.
//

import Foundation

public struct Wallet: Codable, Hashable, Sendable {
	public init(credits: Int) {
		self.credits = credits
	}
	
	public var credits: Int
}
