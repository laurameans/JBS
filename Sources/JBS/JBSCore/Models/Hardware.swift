//
//  File.swift
//  
//
//  Created by Justin Means on 5/27/24.
//

import Foundation
import JCX

@PublicInit
public struct Hardware: DTO {
    public var platform: Platform
    public var osVersion: String?
    public var deviceIdentifier: UUID
    public var createdDate: Date?
    public var updatedDate: Date?
    public var cpuCores: Int?
    public var activeCPUCores: Int?
    public var physicalMemory: UInt64?
    public var diskSpace: String?
    public var usedDiskSpace: String?
    public var hostName: String?
    public var isLowPowerModeEnabled: Bool?
    
    public enum Platform: String, DTO {
        case iOS
        case iPadOS
        case visionOS
        case macOS
        case tvOS
        case watchOS
        case web
        case other
        case unknown
    }
}
