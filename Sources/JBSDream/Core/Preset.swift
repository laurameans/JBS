//
//  File.swift
//  
//
//  Created by Justin Means on 5/8/23.
//

import Foundation
import JBS

public struct Preset: Codable, Equatable, Hashable {
    public init(title: String, promptSet: PromptSet, id: Int) {
        self.title = title
        self.promptSet = promptSet
        self.id = id
    }
    
    public var title: String
    public var promptSet: PromptSet
    public var id: Int
    
    public var image: NSUIImage? {
        if let url = Bundle.main.url(forResource: "preset-\(id)", withExtension: "jpeg", subdirectory: "presets"), let data = try? Data(contentsOf: url) {
            return NSUIImage(data: data)
        } else {
            return nil
        }
    }
    
}

