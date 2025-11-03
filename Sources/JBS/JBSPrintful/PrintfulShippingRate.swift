//
//  PrintfulShippingRate.swift
//
//
//  Created by Justin Means on 11/3/25.
//

import Foundation

@PublicInit
public struct PrintfulShippingRate: DTO {
    public var id: String
    public var name: String
    public var rate: String
    public var currency: String?
    public var minDeliveryDays: Int?
    public var maxDeliveryDays: Int?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case rate
        case currency
        case minDeliveryDays = "min_delivery_days"
        case maxDeliveryDays = "max_delivery_days"
    }
}

@PublicInit
public struct PrintfulShippingRatesRequest: DTO {
    public var recipient: PrintfulShippingRecipient
    public var items: [PrintfulShippingItem]
}

@PublicInit
public struct PrintfulShippingRecipient: DTO {
    public var address1: String
    public var city: String
    public var countryCode: String
    public var stateCode: String
    public var zip: String

    private enum CodingKeys: String, CodingKey {
        case address1
        case city
        case countryCode = "country_code"
        case stateCode = "state_code"
        case zip
    }
}

@PublicInit
public struct PrintfulShippingItem: DTO {
    public var syncVariantId: Int
    public var quantity: Int

    private enum CodingKeys: String, CodingKey {
        case syncVariantId = "sync_variant_id"
        case quantity
    }
}

@PublicInit
public struct PrintfulShippingRatesResponse: DTO {
    public var code: Int
    public var result: [PrintfulShippingRate]
}
