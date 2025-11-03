//
//  CartItem.swift
//
//
//  Created by Justin Means on 11/1/25.
//

import Foundation

@PublicInit
public struct CartItem: DTO {
    public var syncVariantId: Int
    public var name: String
    public var price: Money
    public var quantity: Int
    public var productId: Int
}
