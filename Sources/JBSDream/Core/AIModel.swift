//
//  AIModel.swift
//
//
//  Created by Justin Means on 2/10/24.
//

import Foundation
import JBS

public enum AIModel: String, DTO {
    #if os(macOS)
    case stableDiffusionV1_5macOS
    case riffusionV1_0original
    #elseif os(iOS)
    case stableDiffusionV1_5iOS
    #endif
    case stableDiffusionV2_1macOS
    case riffusionV1_0NeuralEngine
    case stableDiffusionV2_1NeuralEngine
    case realESRGAN
    case stableDiffusionV2_1OriginalIMG2
    case stableDiffusionV2_1NeuralEngineIMG2
    case stableDiffusionV2DepthOriginal
    case stableDiffusionV2DepthANE
    case stableDiffusionV2_1ControlnetCannyMax
    case stableDiffusionV2_1ControlnetScribbleMax
    case stableDiffusionV2_1ControlnetHEDMax
    case sd_2_ControlScribbleMax
    case sd_2_ControlScribbleNeural
    case sd_1_5_TemporalCannyMax
    case sd_2_1_PalettizedNeural
    case sd_2_1_PalettizedMax
    case sd_2_1_ControlScribblePalettizedNeural
    case sd_2_1_ControlScribblePalettizedMax
    case deepTake_1_0_Max
    case deepTake_1_0_Neural
    case voosey_2_2_Max
    case voosey_2_2_Neural
    case deepTake_3_0_Max
    case deepTake_3_0_Neural
    case deepTake_3_0_512x768_Max
    case deepTake_3_0_512x1024_Max
    case deepTake_3_0_768x512_Max
    case deepTake_3_0_768x1024_Max
    case deepTake_3_0_1024x512_Max
    case deepTake_3_0_1024x512_Neural
    case deepTake_3_0_512x1024_Neural
    case flux1Schnell
    case flux1Kontext
    case flux1KontextLora
    case qwenImageEdit
    case nanoBanana
    case wanFLF2V

    public enum ProviderType: String {
        case zip
    }

    public var remoteURL: URL {
        switch self {
        #if os(macOS)
        case .stableDiffusionV1_5macOS:
            return URL(string: "https://cdn.outtakes.com/ai/models/CoreMLModelsMacSD1-5.zip")!

        case .riffusionV1_0original:
            return URL(string: "https://cdn.outtakes.com/ai/models/Riff1-0-ORIGINAL.zip")!
        #elseif os(iOS)
        case .stableDiffusionV1_5iOS:
            return URL(string: "https://cdn.outtakes.com/ai/models/CoreMLModelsiOSSD1-5.zip")!
        #endif
        case .stableDiffusionV2_1macOS:
            return URL(string: "https://cdn.outtakes.com/ai/models/StableDiffusion2-1MacOriginal.zip")!
        case .riffusionV1_0NeuralEngine:
            return URL(string: "https://cdn.outtakes.com/ai/models/Riff1-0-ANE.zip")!
        case .stableDiffusionV2_1NeuralEngine:
            return URL(string: "https://cdn.outtakes.com/ai/models/SD2-1-ANE.zip")!
        case .realESRGAN:
            return URL(string: "https://cdn.outtakes.com/ai/models/realesrgan512.mlmodelc.zip")!
        case .stableDiffusionV2_1OriginalIMG2:
            return URL(string: "https://cdn.outtakes.com/ai/models/StableDiffusion2-1-Original-IMG2.zip")!
        case .stableDiffusionV2_1NeuralEngineIMG2:
            return URL(string: "https://cdn.outtakes.com/ai/models/StableDiffusion2-1-ANE-IMG2.zip")!
        //            return URL(string: "https://huggingface.co/pcuenq/coreml-stable-diffusion-2-1-base/blob/main/coreml-stable-diffusion-2-1-base_split_einsum_compiled.zip")!
        case .stableDiffusionV2DepthOriginal:
            return URL(string: "https://cdn.outtakes.com/ai/models/StableDiffusion2-depth-Original.zip")!
        case .stableDiffusionV2DepthANE:
            return URL(string: "https://cdn.outtakes.com/ai/models/StableDiffusion2-depth-ANE.zip")!
        case .stableDiffusionV2_1ControlnetCannyMax:
            return URL(string: "https://cdn.outtakes.com/ai/models/controlnet-sd21-canny-diffusers-gpu.zip")!
        case .stableDiffusionV2_1ControlnetScribbleMax:
            return URL(string: "https://outtakes.sfo2.digitaloceanspaces.com/ai/models/controlnet-sd21-scribble-diffusers-gpu.zip")!
        case .stableDiffusionV2_1ControlnetHEDMax:
            return URL(string: "https://cdn.outtakes.com/ai/models/controlnet-sd21-hed-diffusers-gpu.zip")!
        case .sd_2_ControlScribbleMax:
            return URL(string: "https://cdn.outtakes.com/ai/models/sd-2-1-controlnet-scribble-canny-max.zip")!
        case .sd_2_ControlScribbleNeural:
            return URL(string: "https://cdn.outtakes.com/ai/models/sd-2-1-controlnet-scribble-canny-neural-2.zip")!
        case .sd_1_5_TemporalCannyMax:
            return URL(string: "https://cdn.outtakes.com/ai/models/sd-1-5-controlnet-temporal-canny-max.zip")!
        case .sd_2_1_PalettizedNeural:
            return URL(string: "https://cdn.outtakes.com/user/6EFE4BA9-43E1-44C9-B582-1E64B61C839D/zip/sd-2-1-base-palettized_split_einsum_v2.zip-536E2918-C8B4-4BE6-A0BE-28E9825D673A")!
        case .sd_2_1_PalettizedMax:
            return URL(string: "https://cdn.outtakes.com/user/6EFE4BA9-43E1-44C9-B582-1E64B61C839D/zip/sd-2-1-base-palettized_original.zip-9154BCF0-B571-4D73-86BB-36F987903F08")!
        case .sd_2_1_ControlScribblePalettizedNeural:
            return URL(string: "https://cdn.outtakes.com/user/1A6EF4CE-9807-4AFC-9898-5D0CA3F75A6F/zip/sd-2-1-controlnet-scribble-palettized_6q-neural.zip-14A95548-31DC-4228-A495-2F25E04DAA4A")!
        case .sd_2_1_ControlScribblePalettizedMax:
            return URL(string: "https://cdn.outtakes.com/user/1A6EF4CE-9807-4AFC-9898-5D0CA3F75A6F/zip/sd-2-1-controlnet-scribble-palettized_6q-original.zip-2B674138-87D4-4A12-974A-88271D62A4F1")!
        case .deepTake_1_0_Max:
            //                return URL(string: "https://cdn.outtakes.com/user/1A6EF4CE-9807-4AFC-9898-5D0CA3F75A6F/zip/DeepTake_1_0_Max.zip-34C9C0C9-F15C-451C-AEED-A74C02A40E9F")!
            //                return URL(string: "https://cdn.outtakes.com/user/1A6EF4CE-9807-4AFC-9898-5D0CA3F75A6F/zip/DeepTake_1_0_MAX.zip-59D99768-9DB5-4EA2-B808-418C6D2D69BB")!
            return URL(string: "https://cdn.outtakes.com/user/1A6EF4CE-9807-4AFC-9898-5D0CA3F75A6F/zip/DeepTake_1_1_MAX.zip-3B5FB2C0-D867-4776-8BFB-4BCAF1E24AFB")!
        case .deepTake_1_0_Neural:
            return URL(string: "")!
        case .voosey_2_2_Max:
            return URL(string: "https://cdn.voosey.com/ai/models/sd-turbo-1-0-0-max.zip")!
        case .voosey_2_2_Neural:
            return URL(string: "https://cdn.voosey.com/ai/models/sd-turbo-1-0-0-neural.zip")!
        case .deepTake_3_0_Max:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-MAX.zip")!
        case .deepTake_3_0_Neural:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-Neural.zip")!
        case .deepTake_3_0_512x768_Max:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-512x768-MAX.zip")!
        case .deepTake_3_0_512x1024_Max:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-512x1024-MAX.zip")!
        case .deepTake_3_0_768x512_Max:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-768x512-MAX.zip")!
        case .deepTake_3_0_768x1024_Max:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-768x1024-MAX.zip")!
        case .deepTake_3_0_1024x512_Max:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-1024x512-MAX.zip")!
        case .deepTake_3_0_1024x512_Neural:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-1024x512-Neural.zip")!
        case .deepTake_3_0_512x1024_Neural:
            return URL(string: "https://cdn.outtakes.com/ai/models/DeepTake-3-0-512x1024-Neural.zip")!
        case .flux1Schnell:
            return URL(string: "https://jws.ai")!
        case .flux1Kontext:
            return URL(string: "https://jws.ai")!
        case .flux1KontextLora:
            return URL(string: "https://jws.ai")!
        case .qwenImageEdit:
            return URL(string: "https://jws.ai")!
        case .nanoBanana:
            return URL(string: "https://jws.ai")!
        case .wanFLF2V:
            return URL(string: "https://jws.ai")!
        }
    }

    public var title: String {
        switch self {
        case .stableDiffusionV2_1macOS:
            return "Stable Diffusion 2.1"
        #if os(macOS)
        case .stableDiffusionV1_5macOS:
            return "Stable Diffusion 1.5"
        case .riffusionV1_0original:
            return "Riffusion 1.0 GPU"
        #elseif os(iOS)
        case .stableDiffusionV1_5iOS:
            return "Stable Diffusion 1.5"
        #endif
        case .riffusionV1_0NeuralEngine:
            return "Riffusion 1.0 Neural Engine"
        case .stableDiffusionV2_1NeuralEngine:
            return "2.1 Neural Engine"
        case .realESRGAN:
            return "RealESRGAN"
        case .stableDiffusionV2_1OriginalIMG2:
            return "2.1 Max"
        case .stableDiffusionV2_1NeuralEngineIMG2:
            return "2.1 Neural"
        case .stableDiffusionV2DepthOriginal:
            return "2 Depth GPU"
        case .stableDiffusionV2DepthANE:
            return "2 Depth Neural Engine"
        case .stableDiffusionV2_1ControlnetCannyMax:
            return "2.1 Canny Control Max"
        case .stableDiffusionV2_1ControlnetScribbleMax:
            return "2.1 Scribble Control Max OLD"
        case .sd_2_ControlScribbleMax:
            return "2.1 Scribble Control Max"
        case .sd_2_ControlScribbleNeural:
            return "2.1 Scribble Control Neural"
        case .stableDiffusionV2_1ControlnetHEDMax:
            return "2.1 HED Control Max"
        case .sd_1_5_TemporalCannyMax:
            return "1.5 Temporal Canny Control Max"
        case .sd_2_1_PalettizedNeural:
            return "2.1 Palettized Neural"
        case .sd_2_1_PalettizedMax:
            return "2.1 Palettized Max"
        case .sd_2_1_ControlScribblePalettizedNeural:
            return "2.1 Turbo Control [Neural]"
        case .sd_2_1_ControlScribblePalettizedMax:
            return "2.1 Turbo Control [Max]"
        case .deepTake_1_0_Max:
            return "DeepTake 1.0 [Max]"
        case .deepTake_1_0_Neural:
            return "DeepTake 1.0 [Neural]"
        case .voosey_2_2_Neural:
            return "Voosey Diffusion 2.2 Neural"
        case .voosey_2_2_Max:
            return "Voosey Diffusion 2.2 Max"
        case .deepTake_3_0_Max:
            return "DeepTake 3.0 Max"
        case .deepTake_3_0_Neural:
            return "DeepTake 3.0 Neural"
        case .deepTake_3_0_512x768_Max:
            return "DeepTake 3.0 512x768 Max"
        case .deepTake_3_0_512x1024_Max:
            return "DeepTake 3.0 512x1024 Max"
        case .deepTake_3_0_768x1024_Max:
            return "DeepTake 3.0 768x1024 Max"
        case .deepTake_3_0_768x512_Max:
            return "DeepTake 3.0 768x512 Max"
        case .deepTake_3_0_1024x512_Max:
            return "DeepTake 3.0 1024x512 Max"
        case .deepTake_3_0_512x1024_Neural:
            return "DeepTake 3.0 512x1024 Neural"
        case .deepTake_3_0_1024x512_Neural:
            return "DeepTake 3.0 1024x512 Neural"
        case .flux1Schnell:
            return "FLUX.1 Schnell"
        case .flux1Kontext:
            return "FLUX.1 Kontext"
        case .flux1KontextLora:
            return "FLUX.1 Kontext Lora"
        case .qwenImageEdit:
            return "Qwen Image Edit"
        case .nanoBanana:
            return "Nano Banana"
        case .wanFLF2V:
            return "WANFLF2V"
        }
    }

    public var providerType: ProviderType {
        return .zip
    }
}
