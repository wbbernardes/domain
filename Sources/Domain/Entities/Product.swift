//
//  Product.swift
//  
//
//  Created by Wesley Brito on 21/05/23.
//

import Foundation
import DataLayer

public struct Product: Equatable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
}

extension Product {
    public func toDTO() -> ProductDTO {
        return ProductDTO(id: self.id,
                          title: self.title,
                          price: self.price,
                          description: self.description,
                          image: self.image,
                          category: self.category)
    }
    
    public func toDomain(obj: ProductDTO) -> Product {
        return Product(id: obj.id,
                          title: obj.title,
                          price: obj.price,
                          description: obj.description,
                          image: obj.image,
                          category: obj.category)
    }
}

extension ProductDTO {
    public func toDomain() -> Product {
        return Product(id: self.id,
                          title: self.title,
                          price: self.price,
                          description: self.description,
                          image: self.image,
                          category: self.category)
    }
}
