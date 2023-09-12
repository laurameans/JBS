//
//  File.swift
//  
//
//  Created by Justin Means on 12/15/21.
//

import Foundation

public enum ReportCategory: String, Codable, CircularCaseSequence {
	case personalPreference
	case nsfw
	case harassment
	case violence
	case illegalSubstance
	case offensive
	case misinformation
	case infringement
	case spam
	case other
	
	public var title: String {
		switch self {
			case .harassment:
				return "Harassment"
			case .illegalSubstance:
				return "Illegal substance use"
			case .infringement:
				return "Copyright infringement"
			case .misinformation:
				return "Misinformation"
			case .nsfw:
				return "Nudity or sexualized content"
			case .offensive:
				return "Offensive"
			case .personalPreference:
				return "Not interested"
			case .violence:
				return "Violence"
			case .spam:
				return "Spam"
			case .other:
				return "Other"
		}
	}
}
