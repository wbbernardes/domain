//
//  ProductRepositoryMock.swift
//
//
//  Created by Wesley Brito on 21/05/23.
//

import Combine
import DataLayer

public class ProductRepositoryMock: ProductRepositoryProtocol {
    public var nextResult: Result<[ProductDTO], Error>?
    
    public func fetchProducts() async throws -> [ProductDTO] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000) // sleep for 1 second
        
        guard let nextResult = nextResult else {
            throw APIError.serverError // replace with an appropriate error
        }
        
        switch nextResult {
        case .success(let mockProducts):
            return mockProducts
        case .failure(let error):
            throw error
        }
    }
}
