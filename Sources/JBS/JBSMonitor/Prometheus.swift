//
//  Prometheus.swift
//
//
//  Created by Justin Means on 6/2/22.
//

import Foundation

public enum Prometheus {
    @PublicInit
    public struct RangeQuery: DTO {
        public var query: String
        public var start: Date
        public var end: Date
        public var step: String
    }

    @PublicInit
    public struct RangeQueryResult: DTO {
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
                        case let .time(t):
                            time = t
                        case let .string(v):
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
    }

    @PublicInit
    public struct GraphData: DTO {
        public var value: Double
        public var time: Date
    }

    @PublicInit
    public struct DataClass: DTO {
        public var resultType: String
        public var result: [Result]
    }

    @PublicInit
    public struct Result: DTO {
        public var metric: [String: String]
        public var values: [[Value]]
    }

    public enum Value: DTO {
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
            case let .time(x):
                try container.encode(x)
            case let .string(x):
                try container.encode(x)
            }
        }
    }
}
