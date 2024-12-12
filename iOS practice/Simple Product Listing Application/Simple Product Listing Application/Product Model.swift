//
//  Product Model.swift
//  Simple Product Listing Application
//
//  Created by patururamesh on 30/09/24.
//

import Foundation

struct Product: Codable {
    let id: Int
    let productCategory: String
    let name: String
    let brand: String
    let description: String
    let basePrice: Int
    let inStock: Bool
    let stock: Int
    let featuredImage: String
    let thumbnailImage: String
    let storageOptions: [String]
    let colorOptions: [String]
    let display: String?
    let CPU: String
    let GPU: String?
    let camera: Camera?

    struct Camera: Codable {
        let rearCamera: String
        let frontCamera: String
    }
}
