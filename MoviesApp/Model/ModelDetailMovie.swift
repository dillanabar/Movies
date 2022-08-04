//
//  ModelDetailMovie.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 11/6/22.
//

import Foundation
// MARK: - ModelDetailMovie

struct ModelDetailMovie: Codable, Identifiable {
    
    let id: String
    let title: String
    let image: String
    let releaseDate: String
    let runtimeMins: String
    let runtimeStr: String
    let year: String
    let plot: String
    let plotLocal: String
    let awards: String
    let directors: String
    let imDbRating: String
    let actorList: [ActorList]
}

// MARK: - ActorList

struct ActorList: Codable ,Identifiable{
    
    let id: String
    let image: String
    let name: String
    let asCharacter: String
    
}


var demoActorList = [
    ActorList(id: "nm0000191", image: "https://imdb-api.com/images/original/MV5BMTg1MjQ0MDg0Nl5BMl5BanBnXkFtZTcwNjYyNjI5Mg@@._V1_Ratio1.0000_AL_.jpg", name: "Ewan McGregor", asCharacter: "Obi-Wan Kenobias Obi-Wan Kenobi"),
    ActorList(id: "nm0000191", image: "https://imdb-api.com/images/original/MV5BMTg1MjQ0MDg0Nl5BMl5BanBnXkFtZTcwNjYyNjI5Mg@@._V1_Ratio1.0000_AL_.jpg", name: "Ewan McGregor", asCharacter: "Obi-Wan Kenobias Obi-Wan Kenobi"),
    ActorList(id: "nm0000191", image: "https://imdb-api.com/images/original/MV5BMTg1MjQ0MDg0Nl5BMl5BanBnXkFtZTcwNjYyNjI5Mg@@._V1_Ratio1.0000_AL_.jpg", name: "Ewan McGregor", asCharacter: "Obi-Wan Kenobias Obi-Wan Kenobi"),
    ActorList(id: "nm0000191", image: "https://imdb-api.com/images/original/MV5BMTg1MjQ0MDg0Nl5BMl5BanBnXkFtZTcwNjYyNjI5Mg@@._V1_Ratio1.0000_AL_.jpg", name: "Ewan McGregor", asCharacter: "Obi-Wan Kenobias Obi-Wan Kenobi"),
    ActorList(id: "nm0000191", image: "https://imdb-api.com/images/original/MV5BMTg1MjQ0MDg0Nl5BMl5BanBnXkFtZTcwNjYyNjI5Mg@@._V1_Ratio1.0000_AL_.jpg", name: "Ewan McGregor", asCharacter: "Obi-Wan Kenobias Obi-Wan Kenobi")]




