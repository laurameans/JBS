//
//  JBSApp.swift
//
//
//  Created by Justin Means on 5/26/22.
//

import Foundation

@PublicInit
public struct JBSApp: DTO {
    public var baseURL: String
    public var title: String
    public var slogan: String
    public var logoImageURL: String
    public var iconImageURL: String
    public var name: JBSAppName
    public var prometheusInstance: String?
    public var prometheusURL: String?
    public var monitorURL: String?
    public var id: UUID?
    public var githubOrgName: String?
    public var githubServerRepoName: String?
}

public struct JBSAppName: RawRepresentable, DTO {
    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public var rawValue: String
}

public enum JBSAppType: DTO {
    case all
    case app(_ app: JBSApp)

    public var appID: String {
        switch self {
        case .all: return "all"
        case let .app(app):
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
}
