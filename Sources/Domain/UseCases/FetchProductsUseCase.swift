//
//  FetchProductsUseCase.swift
//  
//
//  Created by Wesley Brito on 21/05/23.
//

import Foundation
import Combine
import DataLayer

@available(macOS 10.15, *)
public protocol FetchProductsUseCaseProtocol {
    func execute() async throws -> [Product]
}

public class FetchProductsUseCase: FetchProductsUseCaseProtocol {
    private let productRepository: ProductRepositoryProtocol
    

    public init(productRepository: ProductRepositoryProtocol) {
        self.productRepository = productRepository
    }

    @available(macOS 10.15, *)
    public func execute() async throws -> [Product] {
        let object = try await productRepository.fetchProducts()
        return object.map { $0.toDomain() }
    }
}
