//
//  MainframeEvent.swift
//
//
//  Created by Justin Means on 6/7/23.
//

import Foundation

public enum MainframeEvent: Codable, Sendable {
    case log(_ log: String)
    case authenticateServer(_ token: String, appName: JBSAppName)
    case authenticateClient(_ token: String)
    case connected
    case statistics(_ statistics: [MonitorStatisticsV2])
    case systemMetrics(_ metrics: [JBSAppName: [MonitorStatisticsV2]])
    case concurrentUsers(_ value: [JBSAppName: [MainframeUserRepresentable.Micro]])

    public func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
