//
//  File.swift
//  
//
//  Created by Justin Means on 12/30/21.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let iPLog = try? newJSONDecoder().decode(IPLog.self, from: jsonData)

//
// Hashable or Equatable, Sendable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable, Sendable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - IPLog
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
		case status = "status"
		case continent = "continent"
		case continentCode = "continentCode"
		case country = "country"
		case countryCode = "countryCode"
		case region = "region"
		case regionName = "regionName"
		case city = "city"
		case district = "district"
		case zip = "zip"
		case lat = "lat"
		case lon = "lon"
		case timezone = "timezone"
		case offset = "offset"
		case currency = "currency"
		case isp = "isp"
		case org = "org"
		case ipLogAs = "as"
		case asname = "asname"
		case reverse = "reverse"
		case mobile = "mobile"
		case proxy = "proxy"
		case hosting = "hosting"
		case query = "query"
	}
	
	public init(status: String?, continent: String?, continentCode: String?, country: String?, countryCode: String?, region: String?, regionName: String?, city: String?, district: String?, zip: String?, lat: Double?, lon: Double?, timezone: String?, offset: Int?, currency: String?, isp: String?, org: String?, ipLogAs: String?, asname: String?, reverse: String?, mobile: Bool?, proxy: Bool?, hosting: Bool?, query: String?) {
		self.status = status
		self.continent = continent
		self.continentCode = continentCode
		self.country = country
		self.countryCode = countryCode
		self.region = region
		self.regionName = regionName
		self.city = city
		self.district = district
		self.zip = zip
		self.lat = lat
		self.lon = lon
		self.timezone = timezone
		self.offset = offset
		self.currency = currency
		self.isp = isp
		self.org = org
		self.ipLogAs = ipLogAs
		self.asname = asname
		self.reverse = reverse
		self.mobile = mobile
		self.proxy = proxy
		self.hosting = hosting
		self.query = query
	}
}

public struct MainframeIPLog: Codable, Hashable {
	public struct Micro: Codable, Hashable, Identifiable {
		public init(id: UUID?, latitude: Double? = nil, longitude: Double? = nil, username: String? = nil, profilePicURL: String? = nil, lastConnected: Date? = nil, name: String? = nil, userID: UUID? = nil, appName: MeansBridgeAppName) {
			self.id = id
			self.latitude = latitude
			self.longitude = longitude
			self.username = username
			self.profilePicURL = profilePicURL
			self.lastConnected = lastConnected
			self.name = name
			self.userID = userID
			self.appName = appName
		}
		
		public var id: UUID?
		public var latitude: Double?
		public var longitude: Double?
		public var username: String?
		public var profilePicURL: String?
		public var lastConnected: Date?
		public var name: String?
		public var userID: UUID?
		public var appName: MeansBridgeAppName
	}
	
	public struct Global: Codable, Hashable {
		public init(ipLog: IPLog, micro: MainframeIPLog.Micro) {
			self.ipLog = ipLog
			self.micro = micro
		}
		
		public var ipLog: IPLog
		public var micro: MainframeIPLog.Micro
	}
}
