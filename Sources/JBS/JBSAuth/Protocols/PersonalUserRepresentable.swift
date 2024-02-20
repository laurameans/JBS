//
//  PersonalUserRepresentable.swift
//
//
//  Created by Justin Means on 11/12/21.
//

import Foundation

public protocol PersonalUserRepresentable: Codable, Identifiable, Hashable {
    associatedtype Global: GlobalUserRepresentable
    var email: String? { get set }
    var emailConfirmed: Bool? { get set }
    var phone: String? { get set }
    var phoneConfirmed: Bool? { get set }
    var token: String? { get set }
    var global: Global { get set }
    var id: UUID? { get }
    var hasAcceptedTermsAndConditions: Bool { get set }
    var hasAcceptedPrivacyPolicy: Bool { get set }
    var messages: [Message.Global]? { get set }
}

public extension PersonalUserRepresentable {
    var id: UUID? {
        return global.id
    }

    var unreadMessages: Int {
        messages?.filter { $0.viewed == false }.count ?? 2
    }
}
