import Foundation
import JBS
import JCX

public struct News {
    @PublicInit
    public struct Global: DTO {
        public var id: String
        public var publishDate: Date
        public var headline: String
        public var source: String
        public var url: String
        public var summary: String
        public var related: String?
        public var imageURL: String?
        public var lang: String?
        public var hasPaywall: Bool?
    }

    public enum NewsType: StringLiteralType, RawRepresentable, Codable {
        public static let schema = "news_type_enum"
        case macro
        case micro
    }
}
