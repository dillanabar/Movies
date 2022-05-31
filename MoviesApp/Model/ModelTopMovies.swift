//
//  ModelTopMovies.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 31/5/22.
//

import Foundation


struct ModelTopMovies: Codable {
    
    let errorMessage: String
    
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id, rank, title, fullTitle: String
    let year: String
    let image: String
    let crew, imDBRating, imDBRatingCount: String

    enum CodingKeys: String, CodingKey {
        case id, rank, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}