//
//  File.swift
//  
//
//  Created by Justin Means on 7/20/22.
//

import Foundation
#if canImport(MapKit)
import MapKit
#endif

public struct Coordinates: Codable, Equatable, Hashable {
	public init(longitude: Double, latitude: Double) {
		self.longitude = longitude
		self.latitude = latitude
	}
	
	public init(arrayRepresentationLongLat: [Double]) throws {
		guard arrayRepresentationLongLat.indices.contains(0) && arrayRepresentationLongLat.indices.contains(1) else { throw JBSError.custom("Longitude and Latitude not provided within array.") }
		self.longitude = arrayRepresentationLongLat[0]
		self.latitude = arrayRepresentationLongLat[1]
	}
	
	public var longitude: Double
	public var latitude: Double
	
	/// Standard for AWS SDKs
	public var arrayRepresentationLongLat: [Double] {
		[longitude, latitude]
	}
	
	#if canImport(MapKit)
	public var clLocationCoordinate2D: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
	#endif
}

