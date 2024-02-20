//
//  PromptSet.swift
//
//
//  Created by Justin Means on 1/20/23.
//

import Foundation
import JBS
import JCX

@PublicInit
public struct PromptSet: Codable, Hashable {
    public var prompt: String = ""
    public var negativePrompt: String = ""
}
