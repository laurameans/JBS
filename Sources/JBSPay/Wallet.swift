//
//  Wallet.swift
//
//
//  Created by Justin Means on 9/30/22.
//

import Foundation
import JBS
import JCX

@PublicInit
public struct Wallet: DTO {
    public var credits: Int
    public var revenueCatCustomerID: String?
    public var subscriptionExpirationDate: Date?
    public var entitlements: [String: Bool]?
}

@PublicInit
public struct RevenueCatEntitlement: DTO, Identifiable {
    public var id: String
    public var isActive: Bool
    public var willRenew: Bool
    public var expirationDate: Date?
    public var productIdentifier: String
}

@PublicInit
public struct RevenueCatPackage: DTO, Identifiable {
    public var id: String
    public var packageType: String
    public var identifier: String
    public var offering: String
    public var storeProduct: RevenueCatStoreProduct
}

@PublicInit
public struct RevenueCatStoreProduct: DTO {
    public var identifier: String
    public var description: String
    public var title: String
    public var price: Decimal
    public var priceString: String
    public var currencyCode: String
    public var subscriptionPeriod: String?
}

@PublicInit
public struct RevenueCatOffering: DTO, Identifiable {
    public var id: String
    public var description: String
    public var packages: [RevenueCatPackage]
}

@PublicInit
public struct RevenueCatWebhookEvent: DTO {
    public var event: RevenueCatEventType
    public var customerID: String
    public var productID: String?
    public var transactionID: String?
    public var originalTransactionID: String?
    public var expirationDate: Date?
    public var purchaseDate: Date?
    public var currencyCode: String?
    public var price: Decimal?
    public var entitlements: [String]?
}

public enum RevenueCatEventType: String, DTO, Codable {
    case initialPurchase = "INITIAL_PURCHASE"
    case renewal = "RENEWAL" 
    case productChange = "PRODUCT_CHANGE"
    case cancellation = "CANCELLATION"
    case billingIssue = "BILLING_ISSUE"
    case expiration = "EXPIRATION"
    case nonSubscriptionPurchase = "NON_SUBSCRIPTION_PURCHASE"
}

@PublicInit
public struct CreditPackage: DTO, Identifiable {
    public var id: String
    public var title: String
    public var description: String
    public var credits: Int
    public var price: Decimal
    public var imageURL: String?
    public var productIdentifier: String
    public var isSubscription: Bool
    
    public static var voosey1000Credits: CreditPackage {
        CreditPackage(
            id: "voosey_monthly_1000",
            title: "Monthly Subscription",
            description: "1000 credits per month",
            credits: 1000,
            price: 9.99,
            imageURL: nil,
            productIdentifier: "com.jmllc.voosey.subscription.monthly.1000",
            isSubscription: true
        )
    }
}
