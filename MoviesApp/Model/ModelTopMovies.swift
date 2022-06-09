//
//  ModelTopMovies.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 31/5/22.
//

import Foundation

// MARK: - ModelTopMovies

struct ModelTopMovies: Codable {
    
    
    
    let items: [Item]
    let errorMessage: String
}

// MARK: - Item
struct Item: Codable, Identifiable {
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

