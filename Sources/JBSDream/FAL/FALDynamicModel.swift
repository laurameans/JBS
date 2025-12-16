import Foundation
import JBS

public enum FALModelPriority: Int, DTO, Comparable {
    case featured = 0, standard = 1, new = 2, experimental = 3, hidden = 99
    public static func < (lhs: FALModelPriority, rhs: FALModelPriority) -> Bool { lhs.rawValue < rhs.rawValue }
}

@PublicInit
public struct FALDynamicModel: DTO, Sendable, Identifiable {
    public var id: String { endpointID }
    public var endpointID: String
    public var displayName: String
    public var category: String
    public var creditCost: Int
    public var unitPrice: Double
    public var unit: String
    public var currency: String
    public var thumbnailURL: String?
    public var isEnabled: Bool
    public var priority: FALModelPriority?
    public var createdAt: Date?
    enum CodingKeys: String, CodingKey {
        case endpointID = "endpoint_id", displayName = "display_name", category, creditCost = "credit_cost"
        case unitPrice = "unit_price", unit, currency, thumbnailURL = "thumbnail_url", isEnabled = "is_enabled"
        case priority, createdAt = "created_at"
    }
}

public extension Array where Element == FALDynamicModel {
    func sortedForDisplay() -> [FALDynamicModel] {
        filter { $0.isEnabled && $0.priority != .hidden }
            .sorted { ($0.priority ?? .standard, $0.createdAt ?? .distantPast) < ($1.priority ?? .standard, $1.createdAt ?? .distantPast) }
    }
}
