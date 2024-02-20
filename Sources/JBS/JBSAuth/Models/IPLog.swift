//
//  IPLog.swift
//
//
//  Created by Justin Means on 12/30/21.
//

import Foundation

@PublicInit
public struct IPLog: Codable, Hashable {
    public let status: String?
    public let continent: String?
    public let continentCode: String?
    public let country: String?
    public let countryCode: String?
    public let region: String?
    public let regionName: String?
    public let city: String?
    public let district: String?
    public let zip: String?
    public let lat: Double?
    public let lon: Double?
    public let timezone: String?
    public let offset: Int?
    public let currency: String?
    public let isp: String?
    public let org: String?
    public let ipLogAs: String?
    public let asname: String?
    public let reverse: String?
    public let mobile: Bool?
    public let proxy: Bool?
    public let hosting: Bool?
    public let query: String?

    enum CodingKeys: String, CodingKey {
        case status
        case continent
        case continentCode
        case country
        case countryCode
        case region
        case regionName
        case city
        case district
        case zip
        case lat
        case lon
        case timezone
        case offset
        case currency
        case isp
        case org
        case ipLogAs = "as"
        case asname
        case reverse
        case mobile
        case proxy
        case hosting
        case query
    }
}

public struct MainframeIPLog: Codable, Hashable {
    @PublicInit
    public struct Micro: Codable, Hashable, Identifiable {
        public var id: UUID?
        public var latitude: Double?
        public var longitude: Double?
        public var username: String?
        public var profilePicURL: String?
        public var lastConnected: Date?
        public var name: String?
        public var userID: UUID?
        public var appName: JBSAppName
    }

    @PublicInit
    public struct Global: Codable, Hashable {
        public var ipLog: IPLog
        public var micro: MainframeIPLog.Micro
    }
}
