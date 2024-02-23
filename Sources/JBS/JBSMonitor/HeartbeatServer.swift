//
//  File.swift
//
//
//  Created by Justin Means on 2/22/24.
//

import Distributed
import Foundation
import WebSocketActors

public distributed actor HeartbeatServerActor {
    public typealias ActorSystem = WebSocketActorSystem

    var server: HeartbeatServerImplementation
    var clients: Set<HeartbeatClientActor> = []
    
    public init(actorSystem: ActorSystem, server: HeartbeatServerImplementation) {
        self.actorSystem = actorSystem
        self.server = server
    }

    public distributed func sendEvent(_ event: HeartbeatClientEvent) async throws {
        try await server.receiveHeartbeatClientEvent(event)
    }
    
    distributed public func broadcastEvent(_ event: HeartbeatServerEvent) async throws {
        let count = clients.count
        actorSystem.logger.trace("Broadcasting to \(count) heartbeats")
        await withTaskGroup(of: Void.self) { group in
            let logger = self.actorSystem.logger
            for client in clients {
                group.addTask {
                    do {
                        try await client.sendEvent(event)
                    } catch {
                        logger.error("Broadcast error: \(error)")
                    }
                }
            }
        }
        actorSystem.logger.trace("Broadcast complete")
    }
    
    public distributed func register(client: HeartbeatClientActor) async throws {
        actorSystem.logger.trace("HeartbeatServerActor.register(\(client.id))")
        clients.insert(client)
        
        // Immediately broadcast to the new clicker so they have the current value.
        do {
            try await client.sendEvent(.connected)
        } catch {
            actorSystem.logger.error("Broadcast error: \(error)")
        }
        let token = try! await client.retrieveToken()
        print("Retrieved token: \(token)")
    }
    
    public distributed func unregister(monitor: HeartbeatClientActor) {
        actorSystem.logger.trace("HeartbeatServerActor.unregister(\(monitor.id))")
        clients.remove(monitor)
    }
}

public protocol HeartbeatServerImplementation {
    func receiveHeartbeatClientEvent(_ event: HeartbeatClientEvent) async throws
}
