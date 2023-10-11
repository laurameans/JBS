//
//  File.swift
//  
//
//  Created by Justin Means on 6/7/23.
//

import Foundation

public enum MainframeEvent: Codable, Sendable {
    case log(_ log: String)
    case authenticateServer(_ token: String, appName: MeansBridgeAppName)
    case authenticateClient(_ token: String)
    case connected
    case statistics(_ statistics: [MonitorStatisticsV2])
    case systemMetrics(_ metrics: [MeansBridgeAppName: [MonitorStatisticsV2]])
    case concurrentUsers(_ value: [MeansBridgeAppName: [MainframeUserRepresentable.Micro]])
    
    public func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
