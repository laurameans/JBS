//
//  File.swift
//  
//
//  Created by Justin Means on 12/3/22.
//

import Foundation
import JBS

public enum DreamAppendage: StringLiteralType, RawRepresentable, Codable, CircularCaseSequence {
	case photoRealisticWideAngle
	case photoRealistic
	case portrait
	case fisheye
	case digitalArt
	case vaporwave
	case gothic
	case cyberpunk
	case steampunk
	case streetArt
	case pencilSketch
	case politicalCartoon
	case vanGogh
	case picasso
	case dali
	case michelangelo
	case daVinci
	case banksy
	case monet
	case oilCanvas
	case acrylicCanvas
	case charcoal
	case pastel
	case blacklight
	case none
	
	public var nickName: String {
		switch self {
		case .photoRealisticWideAngle:
			return "Photo Realistic Wide Angle"
		case .photoRealistic:
			return "Photo Realistic"
		case .portrait:
			return "Portrait"
		case .fisheye:
			return "Fisheye"
		case .digitalArt:
			return "Digital Art"
		case .cyberpunk:
			return "Cyberpunk"
		case .steampunk:
			return "Steampunk"
		case .politicalCartoon:
			return "Political Cartoon"
		case .blacklight:
			return "Blacklight Art"
		case .none:
			return "leave empty"
		default: return text
		}
	}
	
	public var text: String {
		switch self {
			
		case .photoRealisticWideAngle:
			return "Sony a9 28mm wide angle 4K photo"
		case .photoRealistic:
			return "Sony a9 high resolution photo"
		case .portrait:
			return "Sony a9 portrait, f1.8, 50mm photo"
		case .fisheye:
			return "Sony a9 fisheye ultra wide angle 4K photo"
		case .digitalArt:
			return "Digital Art, trending on ArtStation"
		case .vaporwave:
			return "Vaporwave Art"
		case .gothic:
			return "Gothic Art"
		case .cyberpunk:
			return "Cyberpunk style, trending on Artstation"
		case .steampunk:
			return "Steampunk style, trending on Artstation"
		case .streetArt:
			return "Street Art"
		case .pencilSketch:
			return "Pencil Sketch"
		case .politicalCartoon:
			return "Political cartoon from U.S. Newspaper"
		case .vanGogh:
			return "By Van Gogh"
		case .picasso:
			return "By Picasso"
		case .dali:
			return "By Salvado Dali"
		case .michelangelo:
			return "By Michelangelo"
		case .daVinci:
			return "By DaVinci"
		case .banksy:
			return "By Banksy"
		case .monet:
			return "By Monet"
		case .oilCanvas:
			return "Oil Canvas"
		case .acrylicCanvas:
			return "Acrylic Canvas"
		case .charcoal:
			return "Charcoal Canvas"
		case .pastel:
			return "Pastel Canvas"
		case .blacklight:
			return "Glowing Blacklight Art, Black Light, Trippy"
		case .none:
			return ""
		}
	}
}
