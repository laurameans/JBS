import Foundation
import JBS
import JCX

public enum News {
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

    public enum NewsType: StringLiteralType, RawRepresentable, DTO {
        case macro
        case micro

        public static let schema = "news_type_enum"
    }
}
