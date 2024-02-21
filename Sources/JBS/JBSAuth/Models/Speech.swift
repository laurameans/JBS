//
//  Speech.swift
//
//
//  Created by Justin Means on 3/26/23.
//

import Foundation

public enum Speech {
    @PublicInit
    public struct Request: Codable {
        public var voice: String
        public var items: [Speech.Item]
    }

    public typealias Items = [Item]

    public enum Item: Codable, Hashable {
        case news(_ text: String)
        case conversational(_ text: String)
        case pause(durationMS: Int)
        case standard(_ text: String)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let key = container.allKeys.first

            switch key {
            case .news:
                let value = try container.decode(String.self, forKey: .news)
                self = .news(value)
            case .conversational:
                let value = try container.decode(String.self, forKey: .conversational)
                self = .conversational(value)
            case .pause:
                let value = try container.decode(Int.self, forKey: .pause)
                self = .pause(durationMS: value)
            case .standard:
                let value = try container.decode(String.self, forKey: .standard)
                self = .standard(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Unable to decode speech enum."))
            }
        }

        public var ssml: String {
            var text: String {
                switch self {
                case let .news(text):
                    return "<amazon:domain name='news'>\(text.ssmlFormatted)</amazon:domain>"
                case let .conversational(text):
                    return "<amazon:domain name ='conversational'>\(text.ssmlFormatted)</amazon:domain>"
                case let .pause(durationMS):
                    return "<break time='\(durationMS)ms'/>"
                case let .standard(text):
                    return "\(text.ssmlFormatted)"
                }
            }
            var ret = "<speak>\(text)</speak>"
            return ret
        }

        public var id: String {
            var text: String {
                switch self {
                case let .news(text):
                    return text
                case let .conversational(text):
                    return text
                case let .pause(durationMS: durationMS):
                    return ssml
                case let .standard(text):
                    return text
                }
            }
            return String(text.toBase64().prefix(254))
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case let .conversational(text):
                try container.encode(text, forKey: .conversational)
            case let .news(text):
                try container.encode(text, forKey: .news)
            case let .pause(durationMS: durationMS):
                try container.encode(durationMS, forKey: .pause)
            case let .standard(text):
                try container.encode(text, forKey: .standard)
            }
        }

        enum CodingKeys: CodingKey {
            case news
            case conversational
            case pause
            case standard
        }
    }
}

public protocol Speakable {
    var speechVariations: [Speech.Items] { get }
}

public extension String {
    var ssmlFormatted: String {
        var ssml = self
        var substrings = components(separatedBy: .whitespaces)
        substrings.removeAll(where: { $0.lowercased().contains("http") || $0.lowercased().contains("nyse:") || $0.lowercased().contains("nasdaq:") })
        ssml = substrings.joined(separator: " ")
        ssml = ssml.replacingOccurrences(of: "\\s?\\([\\w\\s]*\\)", with: "", options: .regularExpression)
        ssml = ssml.replacingOccurrences(of: "\"", with: "")
        ssml = ssml.replacingOccurrences(of: "&", with: "&amp;")
        ssml = ssml.replacingOccurrences(of: "'", with: "&apos;")
        ssml = ssml.replacingOccurrences(of: "<", with: "&lt;")
        ssml = ssml.replacingOccurrences(of: ">", with: "&gt;")
        return ssml
    }
}

private extension String {
    /// Returns the base 64 encoded representation
    func base64Encoded() -> String {
        return (data(using: .utf8)?.base64EncodedString())!
    }

    /// Returns the base 64 representation
    func toBase64() -> String {
        return Data(utf8).base64EncodedString()
    }

    /// Returns the base 64 decoded representation
    func base64Decoded() -> String {
        let data = Data(base64Encoded: toBase64())!
        return String(data: data, encoding: .utf8)!
    }
}
