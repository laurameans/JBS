//
//  InferenceModel.swift
//
//
//  Created by Justin Means on 10/15/23.
//

import Foundation

@PublicInit
public struct InferenceModel: DTO {
    public enum Architecture: String, RawRepresentable, DTO {
        case stableDiffusion
        case stableDiffusionXL
        case stableDiffusionControlNet
        case stableDiffusionXLControlNet
        case llamaGGUF
        case imageEncoderGGUF
        case coreML
    }

    public var remoteURL: String
    public var title: String
    public var description: String?
    public var architecture: Architecture
    public var bytes: Int
}
