//
//  PrintfulOrder.swift
//
//
//  Created by Justin Means on 11/1/25.
//

import Foundation

@PublicInit
public struct PrintfulOrderRequest: DTO {
    public var recipient: PrintfulRecipient
    public var items: [PrintfulOrderItem]
}

@PublicInit
public struct PrintfulRecipient: DTO {
    public var name: String
    public var address1: String
    public var city: String
    public var stateCode: String
    public var countryCode: String
    public var zip: String
    public var email: String
}

@PublicInit
public struct PrintfulOrderItem: DTO {
    public var syncVariantId: Int
    public var quantity: Int
}

@PublicInit
public struct PrintfulOrderResponse: DTO {
    public var id: Int
    public var status: String
}
