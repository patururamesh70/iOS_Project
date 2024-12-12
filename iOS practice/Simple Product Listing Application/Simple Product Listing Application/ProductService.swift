//
//  ProductService.swift
//  Simple Product Listing Application
//
//  Created by patururamesh on 30/09/24.
//

import Foundation

class ProductService {
    static func fetchProducts(completion: @escaping ([Product]) -> Void) {
        guard let url = URL(string: "https://dummyapi.online/api/products") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let products = try JSONDecoder().decode([Product].self, from: data)
                    completion(products)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion([])
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
                completion([])
            }
        }.resume()
    }
}
