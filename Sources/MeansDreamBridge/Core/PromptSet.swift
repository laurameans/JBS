//
//  File.swift
//  
//
//  Created by Justin Means on 1/20/23.
//

import Foundation

public struct PromptSet: Codable, Hashable {
	public init(prompt: String, negativePrompt: String = "") {
		self.prompt = prompt
		self.negativePrompt = negativePrompt
//		self.keyframe = keyframe
	}
	
	public var prompt: String
	public var negativePrompt: String
//	public var keyframe: Int
}
