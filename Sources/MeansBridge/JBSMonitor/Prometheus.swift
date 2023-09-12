//
//  File.swift
//  
//
//  Created by Justin Means on 6/2/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rangeQuery = try? newJSONDecoder().decode(RangeQuery.self, from: jsonData)

//
import Foundation

public struct Prometheus {
	public struct RangeQuery: Codable, Hashable {
		public init(query: String, start: Date, end: Date, step: String) {
			self.query = query
			self.start = start
			self.end = end
			self.step = step
		}
		
		public var query: String
		public var start: Date
		public var end: Date
		public var step: String
	}
	
	// MARK: - RangeQuery
	public struct RangeQueryResult: Codable, Hashable {
		public var status: String
		public var data: DataClass
		public var graph: [GraphData] {
			var g: [GraphData] = []
			for result in data.result {
				for outerValue in result.values {
					var time: Date!
					var value: Double!
					for innerValue in outerValue {
						switch innerValue {
							case .time(let t):
								time = t
							case .string(let v):
								value = Double(v) ?? 0
						}
					}
					if let time = time, let value = value {
						g.append(GraphData(value: value, time: time))
					}
				}
			}
			return g
		}
		
		public init(status: String, data: DataClass) {
			self.status = status
			self.data = data
		}
	}
	
	public struct GraphData: Codable, Hashable {
		public init(value: Double, time: Date) {
			self.value = value
			self.time = time
		}
		
		public var value: Double
		public var time: Date
	}
	
	// MARK: - DataClass
	public struct DataClass: Codable, Hashable {
		public var resultType: String
		public var result: [Result]
		
		public init(resultType: String, result: [Result]) {
			self.resultType = resultType
			self.result = result
		}
	}
	
	// MARK: - Result
	public struct Result: Codable, Hashable {
		public var metric: Dictionary<String, String>
		public var values: [[Value]]
		
		public init(metric: Dictionary<String, String>, values: [[Value]]) {
			self.metric = metric
			self.values = values
		}
	}
	
	public enum Value: Codable, Hashable {
		case time(Date)
		case string(String)
		
		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			if let x = try? container.decode(Int.self) {
				//			self = .integer(x)
				self = .time(Date(timeIntervalSince1970: TimeInterval(x)))
				return
			}
			if let x = try? container.decode(String.self) {
				self = .string(x)
				return
			}
			throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
		}
		
		public func encode(to encoder: Encoder) throws {
			var container = encoder.singleValueContainer()
			switch self {
				case .time(let x):
					try container.encode(x)
				case .string(let x):
					try container.encode(x)
			}
		}
	}
}
