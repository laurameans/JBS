//
//  AuthDeviceGlobalRepresentable.swift
//
//
//  Created by Justin Means on 6/12/22.
//

import Foundation

public protocol AuthDeviceGlobalRepresentable: Codable, Identifiable, Hashable {
    associatedtype UserMicro: MicroUserRepresentable
    var user: UserMicro { get set }
    var id: UUID? { get }
    var system: OperatingSystem { get set }
    var osVersion: String { get set }
    var pushToken: String? { get set }
    var channels: [String] { get set }

    init(user: UserMicro, id: UUID?, system: OperatingSystem, osVersion: String, pushToken: String?, channels: [String])
}
