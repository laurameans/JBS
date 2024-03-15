//
//  WebSection.swift
//
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebSection: DTO, Duplicatable {
    public enum SectionType: DTO, CaseIterable, CircularCaseSequence {
        case standard
        case fullWidth
        case fullWidthAndHeight
        
        public var title: String {
            return switch self {
                case .standard:
                    "Standard"
                case .fullWidth:
                    "Full Width"
                case .fullWidthAndHeight:
                    "Full Width + Height"
            }
        }
    }

    public var id: UUID
    public var rows: [WebRow]
    public var enabled: Bool = true
    public var type: SectionType? = .standard
}
