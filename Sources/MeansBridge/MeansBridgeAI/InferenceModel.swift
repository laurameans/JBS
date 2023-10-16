//
//  File.swift
//  
//
//  Created by Justin Means on 10/15/23.
//

import Foundation

public struct InferenceModel: DTO {
    public var remoteURL: String
    public var title: String
    public var description: String?
    public var architecture: Architecture
    public var bytes: Int
    
    public enum Architecture: String, RawRepresentable, DTO {
        case stableDiffusion
        case stableDiffusionXL
        case stableDiffusionControlNet
        case stableDiffusionXLControlNet
        case llamaGGUF
        case imageEncoderGGUF
        case coreML
    }
}
