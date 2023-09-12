//
//  File.swift
//  
//
//  Created by Justin Means on 5/26/22.
//

import Foundation

public struct MeansBridgeApp: Codable, Hashable {
	public init(baseURL: String, title: String, slogan: String, logoImageURL: String, iconImageURL: String, name: MeansBridgeAppName, prometheusInstance: String, prometheusURL: String, id: UUID? = nil) {
		self.baseURL = baseURL
		self.title = title
		self.slogan = slogan
		self.logoImageURL = logoImageURL
		self.iconImageURL = iconImageURL
		self.name = name
		self.prometheusInstance = prometheusInstance
		self.prometheusURL = prometheusURL
		self.id = id
	}
	
	public var baseURL: String
	public var title: String
	public var slogan: String
	public var logoImageURL: String
	public var iconImageURL: String
	public var name: MeansBridgeAppName
	public var prometheusInstance: String?
	public var prometheusURL: String?
	public var id: UUID?
}

public struct MeansBridgeAppName: Codable, RawRepresentable, Hashable, Sendable {
	public var rawValue: String
	
	public init(rawValue: String) {
		self.rawValue = rawValue
	}
}

public enum MeansBridgeAppType: Codable, Hashable {
	case all
	case app(_ app: MeansBridgeApp)
	
	public var appID: String {
		switch self {
			case .all: return "all"
			case .app(let app):
				return app.id?.uuidString ?? ""
		}
	}
}

public extension MeansBridgeAppName {
	static var mainframe: MeansBridgeAppName { MeansBridgeAppName(rawValue: "mainframe") }
	static var all: MeansBridgeAppName { MeansBridgeAppName(rawValue: "all") }
	static var voosey: MeansBridgeAppName { MeansBridgeAppName(rawValue: "voosey") }
	static var neuraform: MeansBridgeAppName { MeansBridgeAppName(rawValue: "neuraform") }
	static var neurafund: MeansBridgeAppName { MeansBridgeAppName(rawValue: "neurafund") }
	static var neuratrade: MeansBridgeAppName { MeansBridgeAppName(rawValue: "neuratrade") }
	static var outtakes: MeansBridgeAppName { MeansBridgeAppName(rawValue: "outtakes") }
	static var globeos: MeansBridgeAppName { MeansBridgeAppName(rawValue: "globeos") }
	static var revolusun: MeansBridgeAppName { MeansBridgeAppName(rawValue: "revolusun") }
}
