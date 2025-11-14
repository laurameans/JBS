//
//  PrintfulProduct.swift
//
//
//  Created by Justin Means on 11/1/25.
//

import Foundation

@PublicInit
public struct PrintfulProduct: DTO {
    public var id: Int
    public var name: String
    public var thumbnail: String?
    public var variants: [PrintfulVariant]
}

@PublicInit
public struct PrintfulVariant: DTO {
    public var id: Int
    public var syncVariantId: Int
    public var name: String
    public var price: Money
    public var currency: String
    public var size: String?
    public var color: String?
    public var availability: String?
    public var imageUrl: String?
    public var previewUrl: String?
    public var sku: String?
}
