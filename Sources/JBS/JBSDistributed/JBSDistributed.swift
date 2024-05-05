//////
//////  File.swift
//////  
//////
//////  Created by Justin Means on 2/21/24.
//////
////
//import Foundation
//import Distributed
//import Logging
//
//public final class JBSDistributedActorSystem: DistributedActorSystem {
//    public typealias ActorID = ActorIdentity
//    
//    public typealias ResultHandler = JBSDistributedResultHandler
//    
//    public typealias SerializationRequirement = any Codable
//    
//    public let logger: Logger
//    
//    public func resolve<Act>(id: ActorID, as actorType: Act.Type) throws -> Act? where Act : DistributedActor, ActorID == Act.ID {
//        <#code#>
//    }
//    
//    public func assignID<Act>(_ actorType: Act.Type) -> ActorID where Act : DistributedActor, ActorID == Act.ID {
//        <#code#>
//    }
//    
//    public func actorReady<Act>(_ actor: Act) where Act : DistributedActor, ActorID == Act.ID {
//        <#code#>
//    }
//    
//    public func resignID(_ id: ActorID) {
//        <#code#>
//    }
//    
//    public func makeInvocationEncoder() -> InvocationEncoder {
//        <#code#>
//    }
//    
//    public func invokeHandlerOnReturn(handler: ResultHandler, resultBuffer: UnsafeRawPointer, metatype: any Any.Type) async throws {
//        <#code#>
//    }
//    
//    public class InvocationEncoder: DistributedTargetInvocationEncoder {
//        public typealias SerializationRequirement = any Codable
//        var genericSubs: [String] = []
//        var argumentData: [Data] = []
//        
//        public func recordGenericSubstitution<T>(_: T.Type) throws {
//            if let name = _mangledTypeName(T.self) {
//                genericSubs.append(name)
//            }
//        }
//        
//        public func recordArgument<Value: Codable>(_ argument: RemoteCallArgument<Value>) throws {
//            let data = try JSONEncoder().encode(argument.value)
//            argumentData.append(data)
//        }
//        
//        public func recordReturnType<R: Codable>(_: R.Type) throws {
//            // noop, no need to record it in this system
//        }
//        
//        public func recordErrorType<E: Error>(_: E.Type) throws {
//            // noop, no need to record it in this system
//        }
//        
//        public func doneRecording() throws {
//            // noop, nothing to do in this system
//        }
//    }
//
//    public class InvocationDecoder: DistributedTargetInvocationDecoder {
//        public typealias SerializationRequirement = any Codable
//        
//        let decoder: JSONDecoder
//        let envelope: RemoteWebSocketCallEnvelope
//        let logger: Logger
//        var argumentsIterator: Array<Data>.Iterator
//        
//        init(system: JBSDistributedActorSystem, envelope: RemoteWebSocketCallEnvelope) {
//            self.envelope = envelope
//            logger = system.logger
//            argumentsIterator = envelope.args.makeIterator()
//            
//            let decoder = JSONDecoder()
//            decoder.userInfo[.actorSystemKey] = system
//            self.decoder = decoder
//        }
//        
//        public func decodeGenericSubstitutions() throws -> [Any.Type] {
//            envelope.genericSubs.compactMap { name in
//                _typeByName(name)
//            }
//        }
//        
//        public func decodeNextArgument<Argument: Codable>() throws -> Argument {
//            let taggedLogger = logger.withOp()
//            
//            guard let data = argumentsIterator.next() else {
//                taggedLogger.trace("none left")
//                throw JBSDistributedError.notEnoughArgumentsInEnvelope(expected: Argument.self)
//            }
//            
//            do {
//                let value = try decoder.decode(Argument.self, from: data)
//                taggedLogger.trace("decoded: \(value)")
//                return value
//            }
//            catch {
//                taggedLogger.trace("error: \(error)")
//                throw error
//            }
//        }
//        
//        public func decodeErrorType() throws -> Any.Type? {
//            nil // not encoded, ok
//        }
//        
//        public func decodeReturnType() throws -> Any.Type? {
//            nil // not encoded, ok
//        }
//    }
//    
//    struct RemoteWebSocketCallEnvelope: Sendable, Codable {
//        let callID: CallID
//        let recipient: ActorIdentity
//        let invocationTarget: String
//        let genericSubs: [String]
//        let args: [Data]
//    }
//}
//
//typealias CallID = UUID
//
//public struct JBSDistributedResultHandler: DistributedTargetInvocationResultHandler {
//    public typealias SerializationRequirement = any Codable
//    
//    let actorSystem: JBSDistributedActorSystem
//    let callID: CallID
//    let system: JBSDistributedActorSystem
//    let remote: RemoteNode
//    
//    public func onReturn<Success: Codable>(value: Success) async throws {
//        system.logger.withOp().with(callID).trace("returning \(value)")
//        let encoder = JSONEncoder()
//        encoder.userInfo[.actorSystemKey] = actorSystem
//        let returnValue = try encoder.encode(value)
//        let envelope = WebSocketReplyEnvelope(callID: callID, sender: nil, value: returnValue)
//        try await actorSystem.write(remote: remote, envelope: WebSocketWireEnvelope.reply(envelope))
//    }
//    
//    public func onReturnVoid() async throws {
//        system.logger.withOp().with(callID).trace("returning Void")
//        let envelope = WebSocketReplyEnvelope(callID: callID, sender: nil, value: "".data(using: .utf8)!)
//        try await actorSystem.write(remote: remote, envelope: WebSocketWireEnvelope.reply(envelope))
//    }
//    
//    public func onThrow<Err: Error>(error: Err) async throws {
//        system.logger.withOp().with(callID).trace("throwing \(error)")
//        // Naive best-effort carrying the error name back to the caller;
//        // Always be careful when exposing error information -- especially do not ship back the entire description
//        // or error of a thrown value as it may contain information which should never leave the node.
//        let envelope = WebSocketReplyEnvelope(callID: callID, sender: nil, value: "".data(using: .utf8)!)
//        try await actorSystem.write(remote: remote, envelope: WebSocketWireEnvelope.reply(envelope))
//    }
//}
//
//public enum JBSDistributedActorSystemMode {
//    case client(of: ServerAddress)
//    case server(at: ServerAddress)
//    case localOnly
//}
//
//enum WebSocketWireEnvelope: Sendable, Codable {
//    case call(RemoteWebSocketCallEnvelope)
//    case reply(WebSocketReplyEnvelope)
//    case connectionClose
//}
//
//struct WebSocketReplyEnvelope: Sendable, Codable {
//    let callID: CallID
//    let sender: JBSDistributedActorSystem.ActorID?
//    let value: Data
//}
//
//struct RemoteWebSocketCallEnvelope: Sendable, Codable {
//    let callID: CallID
//    let recipient: ActorIdentity
//    let invocationTarget: String
//    let genericSubs: [String]
//    let args: [Data]
//}
//
//public enum JBSDistributedError: Error, DistributedActorSystemError {
//    case resolveFailedToMatchActorType(found: Any.Type, expected: Any.Type)
//    case noPeers
//    case notEnoughArgumentsInEnvelope(expected: Any.Type)
//    case failedDecodingResponse(data: Data, error: Error)
//    case decodingError(error: Error)
//    case resolveFailed(id: JBSDistributedActorSystem.ActorID)
//    case invalidServerAddress
//    case failedToCreateServerListeningChannel
//    
//    /// We are trying to send a message to a remote actor, but that actor does not
//    /// have a NodeIdentity. This probably means that the remote node passed us an actor
//    /// that was not constructed using the `JBSDistributedActorSystem.makeActor(id:_:)`,
//    /// as it should have been.
//    case missingNodeID(id: JBSDistributedActorSystem.ActorID)
//    
//    /// We are trying to send a message to a remote actor, but we do not currently
//    /// have an open `Channel` to the remote node. This is currently an error.
//    /// Future versions of this library may attempt to reconnect to the remote node
//    /// instead of throwing this error.
//    case noRemoteNode
//    
//    case failedToUpgrade
//    
//    case missingReplyContinuation(callID: UUID)
//    
//    case secureServerNotSupported
//    
//    /// Attempt to get or set node info outside of a distributed actor.
//    case notInDistributedActor
//    
//    case timeoutWaitingForNodeID(id: NodeIdentity?, timeout: Duration)
//}
