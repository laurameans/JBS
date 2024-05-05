////
////  File.swift
////  
////
////  Created by Justin Means on 4/30/24.
////
//
//import Foundation
//
//public struct ActorIdentity: Sendable, Encodable, CustomStringConvertible, CustomDebugStringConvertible {
//    public let node: NodeIdentity?
//    public let id: String
//    public let type: String?
//    
//    public init(id: String, type: String? = nil, node: NodeIdentity? = nil) {
//        self.id = id
//        self.type = type
//        self.node = node
//    }
//    
//    public init<Act>(id: String, for _: Act.Type, node: NodeIdentity? = nil) {
//        self.id = id
//        self.type = "\(Act.self)"
//        self.node = node
//    }
//    
//    enum CodingKeys: String, CodingKey {
//        case node
//        case id
//        case type
//    }
//    
//    /// Create a random ActorIdentity
//    public static func random(type: String? = nil, node: NodeIdentity? = nil) -> Self {
//        .init(id: "\(UUID().uuidString)", type: type, node: node)
//    }
//    
//    /// Create a random ActorIdentity with a prefix based on the provided type.
//    public static func random<Act>(for _: Act.Type, node: NodeIdentity? = nil) -> Self
//    where Act: DistributedActor, Act.ID == ActorIdentity
//    {
//        .random(type: "\(Act.self)", node: node)
//    }
//    
//    func with(_ nodeID: NodeIdentity) -> ActorIdentity {
//        ActorIdentity(id: id, type: type, node: nodeID)
//    }
//    
//    /// Does this id have the proper prefix for the provided type?
//    public func hasType<Act>(for _: Act.Type) -> Bool
//    where Act: DistributedActor, Act.ID == ActorIdentity
//    {
//        type == "\(Act.self)"
//    }
//    
//    public var description: String {
//        guard let type else { return id }
//        return "\(id) \(type)"
//    }
//    
//    public var debugDescription: String {
//        "\(Self.self)(\(description))"
//    }
//}
//
//extension ActorIdentity: ExpressibleByStringLiteral {
//    public init(stringLiteral value: String) {
//        id = value
//        type = nil
//        node = nil
//    }
//}
//
//extension ActorIdentity: Hashable, Equatable {
//    public func hash(into hasher: inout Hasher) {
//        id.hash(into: &hasher)
//    }
//    
//    public static func == (lhs: ActorIdentity, rhs: ActorIdentity) -> Bool {
//        lhs.id == rhs.id
//    }
//}
//
//extension ActorIdentity: Decodable {
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(String.self, forKey: .id)
//        node = try values.decodeIfPresent(NodeIdentity.self, forKey: .node)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//    }
//}
