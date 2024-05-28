//
//  File.swift
//  
//
//  Created by Justin Means on 5/27/24.
//

import Foundation
import JCX

@PublicInit
public struct Hardware: DTO, Displayable {
    public var platform: Platform
    public var osVersion: String?
    public var deviceIdentifier: UUID
    public var createdDate: Date?
    public var updatedDate: Date?
    public var cpuCores: Int?
    public var activeCPUCores: Int?
    public var physicalMemory: Int64?
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
    
    public var display: OrderedDictionary<String, String> {
        let properties: OrderedDictionary<String, String?> = [
            "Platform": platform.rawValue,
            "OS Version": osVersion,
            "Device Identifier": deviceIdentifier.uuidString,
            "Created Date": createdDate?.formatted(),
            "Updated Date": updatedDate?.formatted(),
            "CPU Cores": cpuCores?.description,
            "Active CPU Cores": activeCPUCores?.description,
            "Physical Memory": physicalMemory?.description,
            "Disk Space": diskSpace,
            "Used Disk Space": usedDiskSpace,
            "Host Name": hostName,
            "Low Power Mode Enabled": isLowPowerModeEnabled?.description
        ]
        
        return properties.compactMapValues { $0 }
    }
    
    public var compactDisplay: OrderedDictionary<String, String> {
        let properties: OrderedDictionary<String, String?> = [
            "OS": "\(platform.rawValue) \(osVersion ?? "")",
            "Specs": "\(cpuCores.map { "CPU Cores: \($0), " } ?? "")\(physicalMemory.map { "Memory: \(JBSByteCountFormatter(countStyle: .memory).string(fromByteCount: $0))" } ?? "")",
            "Host Name": hostName,
        ]
        
        return properties.compactMapValues { $0 }
    }
    
    struct JBSByteCountFormatter {
        enum CountStyle {
            case file // Displays in terms of 1024 bytes
            case memory // Displays in terms of 1000 bytes
        }
        
        var countStyle: CountStyle = .file
        
        func string(fromByteCount byteCount: Int64) -> String {
            let divisor: Int64 = (countStyle == .file) ? 1024 : 1000
            let units = ["bytes", "KB", "MB", "GB", "TB", "PB", "EB"]
            var size = byteCount
            var unitIndex = 0
            
            while size > divisor && unitIndex < units.count - 1 {
                size /= divisor
                unitIndex += 1
            }
            
            return "\(size) \(units[unitIndex])"
        }
    }

}
