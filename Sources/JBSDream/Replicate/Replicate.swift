//
//  Replicate.swift
//
//
//  Created by Justin Means on 9/19/22.
//

import Foundation
import JBS

extension String: ReplicateOutput {}

public enum Replicate {
    @PublicInit
    public struct ClipInterrogator: ReplicatePrediction {
        public var id: String

        public var version: String

        public var urls: Replicate.Urls

        public var createdAt: String?

        public var completedAt: String?

        public var status: Replicate.Status

        public var input: Input

        public var output: Output?

        public var error: String?

        public var logs: String?

        public var metrics: Replicate.Metrics

        public static var slug: String { "clipinterrogator" }

        @PublicInit
        public struct Create: ReplicateCreate {
            public var version: Replicate.Version
            public var webhookCompleted: String?
            public var input: ClipInterrogator.Input
        }

        public struct Input: ReplicateInput {
            public init(image: String, clipModelName: String = "ViT-H-14/laion2b_s32b_b79k", mode: String = "fast") {
                self.image = image
                self.clipModelName = clipModelName
                self.mode = mode
            }

            public var costUSD: Double { 0.14 }
            /// ImageURL
            public var image: String
            public var clipModelName: String
            public var mode: String?

            public enum CodingKeys: String, CodingKey {
                case image
                case clipModelName = "clip_model_name"
                case mode
            }
        }

        public typealias Output = String
        public typealias Status = Replicate.Status
    }
    
    @PublicInit
    public struct StableDiffusion: ReplicatePrediction {
        public static var slug: String { "stablediffusion" }

        @PublicInit
        public struct Create: ReplicateCreate {
            public var version: Replicate.Version

            public var webhookCompleted: String?

            public var input: StableDiffusion.Input
        }

        public var input: Input

        public typealias Output = ReplicateSDOutput

        public var id: String

        public var version: String

        public var urls: Replicate.Urls

        public var createdAt: String?

        public var completedAt: String?

        public var status: Replicate.Status

        public var output: Output?

        public var error: String?

        public var logs: String?

        public var metrics: Replicate.Metrics

        @PublicInit
        public struct Input: ReplicateInput {
            public var costUSD: Double { Double(numOutputs ?? 1) * 0.04 }

            /// Input prompt
            public var prompt: String
            /// Width of output image. Maximum size is 1024x768 or 768x1024 because of memory limits
            public var width: Int?
            /// Height of output image. Maximum size is 1024x768 or 768x1024 because of memory limits
            public var height: Int?
            /// Prompt strength when using init image. 1.0 corresponds to full destruction of information in init image
            public var promptStrength: Double?
            /// Number of images to output
            public var numOutputs: Int?
            /// Number of denoising steps (minimum: 1; maximum: 500)
            public var numInferenceSteps: Int?
            /// Scale for classifier-free guidance (minimum: 1; maximum: 20)
            public var guidanceScale: Double?
            /// Random seed. Leave blank to randomize the seed
            public var seed: String?

            public var initImage: String?
            public var mask: String?

            enum CodingKeys: String, CodingKey {
                case prompt
                case width
                case height
                case promptStrength = "prompt_strength"
                case numOutputs = "num_outputs"
                case numInferenceSteps = "num_inference_steps"
                case guidanceScale = "guidance_scale"
                case seed
                case initImage = "init_image"
                case mask
            }
        }
    }

    @PublicInit
    public struct Fractal: ReplicatePrediction {
        public static var slug: String { "fractal" }

        @PublicInit
        public struct Create: ReplicateCreate, Equatable {
            public init() {
                version = .fractal
                webhookCompleted = nil
                input = Input(prompt: "", outputFormat: "mp4", inpaintIter: 1)
            }

            public var version: Replicate.Version

            public var webhookCompleted: String?

            public var input: Fractal.Input
        }

        public var input: Input

        public var id: String

        public var version: String

        public var urls: Replicate.Urls

        public var createdAt: String?

        public var completedAt: String?

        public var status: Replicate.Status

        public var output: Output?

        public var error: String?

        public var logs: String?

        public var metrics: Replicate.Metrics

        @PublicInit
        public struct Input: ReplicateInput {
            public var costUSD: Double { 0.14 }
            public var prompt: String
            public var outputFormat: String
            public var inpaintIter: Int

            enum CodingKeys: String, CodingKey {
                case prompt
                case outputFormat = "output_format"
                case inpaintIter = "inpaint_iter"
            }
        }

        @PublicInit
        public struct Output: ReplicateOutput, Equatable {
            public var mp4: String?

            enum CodingKeys: String, CodingKey {
                case mp4
            }
        }
    }

    @PublicInit
    public struct LatentTraverse: ReplicatePrediction {
        public static var slug: String { "latenttraverse" }

        public enum ColorCoherence: String, RawRepresentable, Codable, CircularCaseSequence {
            case matchFrame0LAB = "Match Frame 0 LAB"
            case matchFrame0HSV = "Match Frame 0 HSV"
            case matchFrame0RGB = "Match Frame 0 RGB"
        }

        public enum Sampler: String, RawRepresentable, Codable, CircularCaseSequence {
            case klms
            case dpm2
            case dpm2_ancestral
            case heun
            case euler
            case euler_ancestral
            case plms
            case ddim
        }

        @PublicInit
        public struct Create: ReplicateCreate {
            public init() {
                version = .latentTraverse
                webhookCompleted = nil
                input = LatentTraverse.Input(maxFrames: 120, angle: "1.005", zoom: "1.005", translationX: "0.0", translationY: "0.0", colorCoherence: .matchFrame0LAB, sampler: .klms, fps: 18)
            }

            public var version: Replicate.Version

            public var webhookCompleted: String?

            public var input: LatentTraverse.Input
        }

        public var input: Input

        public typealias Output = String

        public var id: String

        public var version: String

        public var urls: Replicate.Urls

        public var createdAt: String?

        public var completedAt: String?

        public var status: Replicate.Status

        public var output: Output?

        public var error: String?

        public var logs: String?

        public var metrics: Replicate.Metrics

        @PublicInit
        public struct Input: ReplicateInput {
            public var costUSD: Double { 2.90 }
            public var maxFrames: Int
            public var angle: String
            public var zoom: String
            public var translationX: String
            public var translationY: String
            public var colorCoherence: ColorCoherence
            public var sampler: Sampler
            public var fps: Int
            public var seed: Int?

            enum CodingKeys: String, CodingKey {
                case maxFrames = "max_frames"
                case angle
                case zoom
                case translationX = "translation_x"
                case translationY = "translation_y"
                case colorCoherence = "color_coherence"
                case sampler
                case fps
                case seed
            }
        }
    }

    public enum Status: String, RawRepresentable, DreamStatus {
        case starting
        case processing
        case succeeded
        case failed
        case canceled
    }

    public enum Version: String, RawRepresentable, Codable, Hashable, Sendable {
        case material = "56f26876a159c10b429c382f66ccda648c1d5678d7ce15ed010734b715be5ab9"
        case stableDiffusion = "a9758cbfbd5f3c2094457d996681af52552901775aa2d6dd0b17fd15df959bef"
        case stableDiffusionV1_5 = "f370727477aa04d12d8c0b5c4e3a22399296c21cd18ff67cd7619710630fe3cb"
        case latentTraverse = "e22e77495f2fb83c34d5fae2ad8ab63c0a87b6b573b6208e1535b23b89ea66d6"
        case fractal = "a2527c5074fc0cf9fa6015a40d75d080d1ddf7082fabe142f1ccd882c18fce61"
        case clipInterrogator = "41fdb702d3fbe06c9835e39ac6ddfb8dee872835b22d6e8a7e0a467c793155f9"

        public var Prediction: any ReplicatePrediction.Type {
            switch self {
            case .material:
                return StableDiffusion.self
            case .stableDiffusion:
                return StableDiffusion.self
            case .stableDiffusionV1_5:
                return StableDiffusion.self
            case .latentTraverse:
                return LatentTraverse.self
            case .fractal:
                return LatentTraverse.self
            case .clipInterrogator:
                return ClipInterrogator.self
            }
        }
    }

    // MARK: - Metrics

    @PublicInit
    public struct Metrics: Codable, Hashable, Sendable {
        public var predictTime: Double?

        enum CodingKeys: String, CodingKey {
            case predictTime = "predict_time"
        }
    }

    // MARK: - Urls
    @PublicInit
    public struct Urls: Codable, Hashable, Sendable {
        public var urlsGet: String
        public var cancel: String

        enum CodingKeys: String, CodingKey {
            case urlsGet = "get"
            case cancel
        }
    }
}

public protocol ReplicateInput: DreamInput {
    var costUSD: Double { get }
}

public protocol ReplicateCreate: DreamPredictionCreate {
    associatedtype Input: ReplicateInput
    var version: Replicate.Version { get set }
    var input: Input { get set }
    var webhookCompleted: String? { get set }
    //	init()
}

public extension ReplicateCreate {
    var costUSD: Double {
        input.costUSD
    }

    var costCredits: Int {
        Int(input.costUSD.rounded(.awayFromZero)) * 25
    }
}

public protocol ReplicateOutput: DreamOutput {}

public protocol ReplicatePrediction: DreamPrediction where Status == Replicate.Status {
    associatedtype Input: ReplicateInput
    associatedtype Output
    associatedtype Create: ReplicateCreate
    //	associatedtype Status: Replicate.Status
    var version: String { get set }
    var urls: Replicate.Urls { get set }
    var createdAt: String? { get set }
    var completedAt: String? { get set }
    var metrics: Replicate.Metrics { get set }
}

public extension ReplicatePrediction {
    var idString: String { id as! String }
}

// extension Array: ReplicateOutput where Element: ReplicateOutput {
//
// }
//
//

public typealias ReplicateSDOutput = [String]
extension ReplicateSDOutput: Codable, Hashable, Sendable {}

// extension ReplicateSDOutput: DreamOutput { }

// extension Array: Codable, Hashable, Sendable where Element == String {
////	func hash(into hasher: inout Hasher) {
////		for element in self {
////			hasher.combine(element)
////		}
////	}
// }
