//
//  IPLog.swift
//
//
//  Created by Justin Means on 12/30/21.
//

import Foundation

@PublicInit
public struct IPLog: DTO, Displayable {
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
    
    public var display: OrderedDictionary<String, String> {
        let properties: OrderedDictionary<String, String?> = [
            "Status": status,
            "Continent": continent,
            "Continent Code": continentCode,
            "Country": country,
            "Country Code": countryCode,
            "Region": region,
            "Region Name": regionName,
            "City": city,
            "District": district,
            "ZIP Code": zip,
            "Latitude": lat?.description,
            "Longitude": lon?.description,
            "Timezone": timezone,
            "UTC Offset": offset?.description,
            "Currency": currency,
            "ISP": isp,
            "Organization": org,
            "AS Number": ipLogAs,
            "AS Name": asname,
            "Reverse DNS": reverse,
            "Mobile": mobile?.description,
            "Proxy": proxy?.description,
            "Hosting": hosting?.description,
            "Query IP": query
        ]
        
        return properties.compactMapValues { $0 }
    }
    
    public var compactDisplay: OrderedDictionary<String, String> {
        let properties: OrderedDictionary<String, String?> = [
            "Location": "\(city.map { "\($0), "}.unwrapped)\(regionName.map { "\($0), " }.unwrapped)\(country.map { "\($0)" }.unwrapped)\(zip.map { ", \($0)" }.unwrapped)\(lat.map { ". Lat: \($0)" }.unwrapped)\(lon.map { ", Lon: \($0)" }.unwrapped)",
            "ISP": "\(ipLogAs.map { "Log As: \($0), " }.unwrapped)\(reverse.map { "Reverse: \($0)" }.unwrapped)",
        ]
        
        // Filter out nil values
        return properties.compactMapValues { $0 }
    }
}

public struct MainframeIPLog {
    @PublicInit
    public struct Micro: DTO, Identifiable {
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
    public struct Global: DTO {
        public var ipLog: IPLog
        public var micro: MainframeIPLog.Micro
    }
}

public struct JWSIPLog: DTO {
    public var country: String?
    public var stateprov: String?
    public var stateprovCode: String?
    public var city: String?
    public var latitude: String?
    public var longitude: String?
    public var continent: String?
    public var timezone: String?
    public var usMetroCode: Int?
    public var accuracyRadius: Int?
    public var asn: Int?
    public var asnOrganization: String?
    public var asnNetwork: String?
    public var reverse: String?
    public var query: String?
    
    public enum CodingKeys: String, CodingKey {
        case country = "country"
        case stateprov = "stateprov"
        case stateprovCode = "stateprovCode"
        case city = "city"
        case latitude = "latitude"
        case longitude = "longitude"
        case continent = "continent"
        case timezone = "timezone"
        case usMetroCode = "usMetroCode"
        case accuracyRadius = "accuracyRadius"
        case asn = "asn"
        case asnOrganization = "asnOrganization"
        case asnNetwork = "asnNetwork"
        case reverse = "reverse"
        case query = "query"
    }
    
    public var ipLog: IPLog {
        IPLog(status: nil, continent: self.continent, continentCode: nil, country: self.country, countryCode: nil, region: nil, regionName: nil, city: self.city, district: nil, zip: nil, lat: self.latitude.flatMap { Double($0) }, lon: self.longitude.flatMap { Double($0) }, timezone: self.timezone, offset: nil, currency: nil, isp: nil, org: nil, ipLogAs: asnOrganization, asname: asn.map { String($0) }, reverse: reverse, mobile: nil, proxy: nil, hosting: nil, query: query)
    }
}
