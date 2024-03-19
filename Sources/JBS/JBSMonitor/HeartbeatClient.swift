////
////  File.swift
////
////
////  Created by Justin Means on 2/22/24.
////
//
//import Distributed
//import Foundation
//import WebSocketActors
//
//public distributed actor HeartbeatClientActor {
//    public typealias ActorSystem = WebSocketActorSystem
//
//    var client: HeartbeatClientImplementation
//
//    public init(actorSystem: ActorSystem, client: HeartbeatClientImplementation) {
//        self.actorSystem = actorSystem
//        self.client = client
//    }
//
//    public distributed func retrieveToken() throws -> String? {
//        return try? client.retrieveToken()
//    }
//
//    public distributed func sendEvent(_ event: HeartbeatServerEvent) async throws {
//        try await client.receiveHeartbeatServerEvent(event)
//    }
//}
//
//public protocol HeartbeatClientImplementation {
//    func retrieveToken() throws -> String
//    func receiveHeartbeatServerEvent(_ event: HeartbeatServerEvent) async throws
//}
