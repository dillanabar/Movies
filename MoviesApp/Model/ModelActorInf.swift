//
//  ModelActorInf.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 4/8/22.
//

import Foundation


// MARK: - ModelActorInf


struct ModelActorInf: Codable {
    
    let id: String
    let name:  String
    let role: String
    let image: String
    let summary: String
    let birthDate: String
    let awards: String
    let listMovies:  [ListMovies]
    
    enum CodingKeys: String, CodingKey {
        case id, name, role, image, summary, birthDate, awards
        case listMovies = "knownFor"
    }
    
    
    
}

struct ListMovies: Codable
{
    let id: String
    let title: String
    let fullTitle: String
    let image: String
}
