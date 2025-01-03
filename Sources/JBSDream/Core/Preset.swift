//
//  Preset.swift
//
//
//  Created by Justin Means on 5/8/23.
//

import Foundation
import JBS

@PublicInit
public struct Preset: DTO {
    public var title: String
    public var promptSet: PromptSet
    public var id: Int

    #if !os(Linux)
    public var image: NSUIImage? {
        if let url = Bundle.main.url(forResource: "preset-\(id)", withExtension: "jpeg", subdirectory: "presets"), let data = try? Data(contentsOf: url) {
            return NSUIImage(data: data)
        } else {
            return nil
        }
    }
    #endif
}
