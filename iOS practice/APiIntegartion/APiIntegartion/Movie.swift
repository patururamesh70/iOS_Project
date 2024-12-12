//
//  Movie.swift
//  APiIntegartion
//
//  Created by patururamesh on 16/08/24.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let movie: String
    let rating: Double
    let image: String
    let imdbURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case movie
        case rating
        case image
        case imdbURL = "imdb_url"
    }
}
