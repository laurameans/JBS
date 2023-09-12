//
//  File.swift
//  
//
//  Created by Justin Means on 3/26/23.
//

import Foundation

public struct Speech {
	public struct Request: Codable {
		public init(voice: String, items: [Speech.Item]) {
			self.voice = voice
			self.items = items
		}
		
		public var voice: String
		public var items: [Speech.Item]
		
		//		public var ssml: String {
		//			return "<speak>\(items.map({ $0.ssml }).joined(separator: " "))</speak>"
		//		}
	}
	
	public typealias Items = [Item]
	
	public enum Item: Codable, Hashable {
		enum CodingKeys: CodingKey {
			case news
			case conversational
			case pause
			case standard
		}
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
		
		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			switch self {
				case .conversational(let text):
					try container.encode(text, forKey: .conversational)
				case .news(let text):
					try container.encode(text, forKey: .news)
				case .pause(durationMS: let durationMS):
					try container.encode(durationMS, forKey: .pause)
				case .standard(let text):
					try container.encode(text, forKey: .standard)
			}
		}
		
		public var ssml: String {
			var text: String {
				switch self {
						
					case .news(let text):
						return "<amazon:domain name='news'>\(text.ssmlFormatted)</amazon:domain>"
					case .conversational(let text):
						return "<amazon:domain name ='conversational'>\(text.ssmlFormatted)</amazon:domain>"
					case .pause(let durationMS):
						return "<break time='\(durationMS)ms'/>"
					case .standard(let text):
						return "\(text.ssmlFormatted)"
				}
			}
			var ret = "<speak>\(text)</speak>"
			return ret
		}
		public var id: String {
			var text: String {
				switch self {
					case .news(let text):
						return text
					case .conversational(let text):
						return text
					case .pause(durationMS: let durationMS):
						return ssml
					case .standard(let text):
						return text
				}
			}
			return String(text.toBase64().prefix(254))
		}
		case news(_ text: String)
		case conversational(_ text: String)
		case pause(durationMS: Int)
		case standard(_ text: String)
	}
	//
	//	public enum Voice {
	//		case americanFemale
	//		case americanMale
	//		case spanishMale
	//		case britishFemale
	//		case
	//	}
}

public protocol Speakable {
	var speechVariations: [Speech.Items] { get }
}

public extension String {
	var ssmlFormatted: String {
		var ssml = self
		var substrings = self.components(separatedBy: .whitespaces)
		substrings.removeAll(where: { $0.lowercased().contains("http") || $0.lowercased().contains("nyse:") || $0.lowercased().contains("nasdaq:") })
		ssml = substrings.joined(separator: " ")
		ssml = ssml.replacingOccurrences(of: "\\s?\\([\\w\\s]*\\)", with: "", options: .regularExpression)
		//        ssml = ssml.replacingOccurrences(of: "\"", with: "&quot;")
		ssml = ssml.replacingOccurrences(of: "\"", with: "")
		ssml = ssml.replacingOccurrences(of: "&", with: "&amp;")
		ssml = ssml.replacingOccurrences(of: "'", with: "&apos;")
		ssml = ssml.replacingOccurrences(of: "<", with: "&lt;")
		ssml = ssml.replacingOccurrences(of: ">", with: "&gt;")
		return ssml
	}
}

extension String {
	
	/// Returns the base 64 encoded representation
	fileprivate func base64Encoded() -> String {
		return (data(using: .utf8)?.base64EncodedString())!
	}
	
	
	/// Returns the base 64 representation
	fileprivate func toBase64() -> String {
		return Data(self.utf8).base64EncodedString()
	}
	
	
	/// Returns the base 64 decoded representation
	fileprivate func base64Decoded() -> String {
		let data = Data(base64Encoded: self.toBase64())!
		return String(data: data, encoding: .utf8)!
	}
}

