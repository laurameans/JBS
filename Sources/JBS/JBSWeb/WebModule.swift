//
//  WebModule.swift
//
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebContent: DTO, Duplicatable {
    public var id: UUID
    public var type: ModuleType
    public var value: String
    public var link: String?
    public var enabled: Bool = true
    public var rawHTML: String?
    public var doubleWidth: Bool?
    public var style: String?
    public var computedHTML: String {
        ""
    }

    public enum ModuleType: DTO, CaseIterable {
        case text
        case image
        case button
        case video

        public var title: String {
            return switch self {
            case .text: "Text"
            case .image: "Image"
            case .button: "Button"
            case .video: "Video"
            }
        }

        public var sfSymbolName: String {
            return switch self {
            case .text:
                "character.textbox"
            case .image:
                "photo"
            case .button:
                "button.programmable.square"
            case .video:
                "film"
            }
        }
    }
}
