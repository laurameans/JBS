//
//  File.swift
//  
//
//  Created by Justin Means on 2/21/24.
//

import Foundation
import Distributed
import WebSocketActors

typealias DefaultDistributedActorSystem = WebSocketActorSystem

//extension NodeIdentity {
//    public static let server = NodeIdentity(id: "server")
//}

extension ActorIdentity {
    public static let heartbeatServer = ActorIdentity(id: "heartbeatServer")
}
