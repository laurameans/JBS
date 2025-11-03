//
//  PrintfulTaxRate.swift
//
//
//  Created by Justin Means on 11/3/25.
//

import Foundation

@PublicInit
public struct PrintfulTaxRate: DTO {
    public var required: Bool
    public var rate: Double
    public var shippingTaxable: Bool

    private enum CodingKeys: String, CodingKey {
        case required
        case rate
        case shippingTaxable = "shipping_taxable"
    }
}

@PublicInit
public struct PrintfulTaxRateRequest: DTO {
    public var recipient: PrintfulTaxRecipient
}

@PublicInit
public struct PrintfulTaxRecipient: DTO {
    public var countryCode: String
    public var stateCode: String
    public var city: String
    public var zip: String

    private enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case stateCode = "state_code"
        case city
        case zip
    }
}

@PublicInit
public struct PrintfulTaxRateResponse: DTO {
    public var code: Int
    public var result: PrintfulTaxRate
}
