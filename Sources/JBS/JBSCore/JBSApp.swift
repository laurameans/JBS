//
//  File.swift
//  
//
//  Created by Justin Means on 5/26/22.
//

import Foundation

public struct JBSApp: Codable, Hashable {
	public init(baseURL: String, title: String, slogan: String, logoImageURL: String, iconImageURL: String, name: JBSAppName, prometheusInstance: String, prometheusURL: String, id: UUID? = nil) {
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
	public var name: JBSAppName
	public var prometheusInstance: String?
	public var prometheusURL: String?
	public var id: UUID?
}

public struct JBSAppName: Codable, RawRepresentable, Hashable {
	public var rawValue: String
	
	public init(rawValue: String) {
		self.rawValue = rawValue
	}
}

public enum JBSAppType: Codable, Hashable {
	case all
	case app(_ app: JBSApp)
	
	public var appID: String {
		switch self {
			case .all: return "all"
			case .app(let app):
				return app.id?.uuidString ?? ""
		}
	}
}

public extension JBSAppName {
	static var mainframe: JBSAppName { JBSAppName(rawValue: "mainframe") }
	static var all: JBSAppName { JBSAppName(rawValue: "all") }
	static var voosey: JBSAppName { JBSAppName(rawValue: "voosey") }
	static var neuraform: JBSAppName { JBSAppName(rawValue: "neuraform") }
	static var neurafund: JBSAppName { JBSAppName(rawValue: "neurafund") }
	static var neuratrade: JBSAppName { JBSAppName(rawValue: "neuratrade") }
	static var outtakes: JBSAppName { JBSAppName(rawValue: "outtakes") }
	static var globeos: JBSAppName { JBSAppName(rawValue: "globeos") }
	static var revolusun: JBSAppName { JBSAppName(rawValue: "revolusun") }
	static var skatedex: JBSAppName { JBSAppName(rawValue: "skatedex") }
}
