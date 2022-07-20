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
