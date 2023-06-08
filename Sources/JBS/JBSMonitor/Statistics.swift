//
//  File.swift
//  
//
//  Created by Justin Means on 5/25/22.
//

import Foundation

public struct MonitorStatistics: Codable, Hashable {
	public init(dailyActiveUsers: Int, monthlyActiveUsers: Int, totalUsers: Int, app: JBSApp) {
		self.dailyActiveUsers = dailyActiveUsers
		self.monthlyActiveUsers = monthlyActiveUsers
		self.totalUsers = totalUsers
		self.app = app
	}
	
	public var dailyActiveUsers: Int
	public var monthlyActiveUsers: Int
	public var totalUsers: Int
	public var app: JBSApp
}

public struct MonitorSystemMetrics: Codable, Hashable, Equatable {
    public init(virtualMemoryBytes: Int, residentMemoryBytes: Int, startTimeSeconds: Int, cpuSeconds: Int, maxFileDescriptors: Int, openFileDescriptors: Int, cpuUsage: Double) {
        self.virtualMemoryBytes = virtualMemoryBytes
        self.residentMemoryBytes = residentMemoryBytes
        self.startTimeSeconds = startTimeSeconds
        self.cpuSeconds = cpuSeconds
        self.maxFileDescriptors = maxFileDescriptors
        self.openFileDescriptors = openFileDescriptors
        self.cpuUsage = cpuUsage
    }
    
    /// Virtual memory size in bytes.
    public var virtualMemoryBytes: Int
    /// Resident memory size in bytes.
    public var residentMemoryBytes: Int
    /// Start time of the process since unix epoch in seconds.
    public var startTimeSeconds: Int
    /// Total user and system CPU time spent in seconds.
    public var cpuSeconds: Int
    /// Maximum number of open file descriptors.
    public var maxFileDescriptors: Int
    /// Number of open file descriptors.
    public var openFileDescriptors: Int
    /// CPU usage percentage.
    public var cpuUsage: Double
}

public struct MonitorStatisticsV2: Codable, Hashable, Sendable {
	public init(key: MonitorStatisticsV2.Key, value: Double, title: String? = nil, roundingLevel: Int, position: MonitorStatisticsV2.Position, createdDate: Date? = nil, updatedDate: Date? = nil, deletedDate: Date? = nil) {
		self.key = key
		self.value = value
		self.title = title
		self.roundingLevel = roundingLevel
		self.position = position
		self.createdDate = createdDate
		self.updatedDate = updatedDate
		self.deletedDate = deletedDate
	}
	
	public var key: Key
	public var value: Double
	public var title: String?
	public var roundingLevel: Int
	public var position: Position
	public var createdDate: Date?
	public var updatedDate: Date?
	public var deletedDate: Date?
	
	public struct Key: RawRepresentable, Codable, Sendable, Hashable {
		public var rawValue: String
		public var title: String?
		public var roundingLevel: Int?
		public var position: Position?
		
		public init(rawValue: String) {
			self.rawValue = rawValue
		}
		
		public init(rawValue: String, title: String, roundingLevel: Int, position: Position) {
			self.rawValue = rawValue
			self.title = title
			self.roundingLevel = roundingLevel
			self.position = position
		}
	}
	
	public enum Position: String, Codable, Sendable, Hashable {
		case pinned
		case top
		case middle
		case bottom
	}
}

public extension MonitorStatisticsV2 {
    static func + (lhs: MonitorStatisticsV2, rhs: MonitorStatisticsV2) -> MonitorStatisticsV2 {
        guard lhs.key.rawValue == rhs.key.rawValue else {
            fatalError("Mismatched keys: \(lhs.key.rawValue) and \(rhs.key.rawValue)")
        }
        
        return MonitorStatisticsV2(key: lhs.key,
                                   value: lhs.value + rhs.value,
                                   title: lhs.title ?? rhs.title,
                                   roundingLevel: lhs.roundingLevel,
                                   position: lhs.position,
                                   createdDate: lhs.createdDate,
                                   updatedDate: Date(), // Mark the updated time as the current time
                                   deletedDate: lhs.deletedDate ?? rhs.deletedDate)
    }
    
    static func - (lhs: MonitorStatisticsV2, rhs: MonitorStatisticsV2) -> MonitorStatisticsV2 {
        guard lhs.key.rawValue == rhs.key.rawValue else {
            fatalError("Mismatched keys: \(lhs.key.rawValue) and \(rhs.key.rawValue)")
        }
        
        return MonitorStatisticsV2(key: lhs.key,
                                   value: lhs.value - rhs.value,
                                   title: lhs.title ?? rhs.title,
                                   roundingLevel: lhs.roundingLevel,
                                   position: lhs.position,
                                   createdDate: lhs.createdDate,
                                   updatedDate: Date(), // Mark the updated time as the current time
                                   deletedDate: lhs.deletedDate ?? rhs.deletedDate)
    }
}


public extension MonitorStatisticsV2.Key {
	static var emailsSent: MonitorStatisticsV2.Key {
		MonitorStatisticsV2.Key(rawValue: "emails_sent", title: "Emails Sent", roundingLevel: 0, position: .bottom)
	}
	static var textsSent: MonitorStatisticsV2.Key {
		MonitorStatisticsV2.Key(rawValue: "texts_sent", title: "Texts Sent", roundingLevel: 0, position: .bottom)
	}
	
	static var dailyActiveUsers: MonitorStatisticsV2.Key {
		MonitorStatisticsV2.Key(rawValue: "daily_active_users", title: "Daily Active Users", roundingLevel: 0, position: .pinned)
	}
	
	static var monthlyActiveUsers: MonitorStatisticsV2.Key {
		MonitorStatisticsV2.Key(rawValue: "monthly_active_users", title: "Monthly Active Users", roundingLevel: 0, position: .pinned)
	}
	
	static var totalUsers: MonitorStatisticsV2.Key {
		MonitorStatisticsV2.Key(rawValue: "total_users", title: "Total Users", roundingLevel: 0, position: .pinned)
	}
	
}
