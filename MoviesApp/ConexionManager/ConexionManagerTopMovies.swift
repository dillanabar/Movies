//
//  ConexionManagerTopMovies.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 1/6/22.
//

import Foundation
import SwiftUI

final class ConexionManagerTopMovies: ObservableObject{
    
    enum TopMoviesFetcherError: Error {
        case invalidURL
        case missingData
    }
    
    @Published var arrayTopMovies = [ModelTopMovies.Item]()
    
    func fechDataTopMovies() async throws {
        
        guard let url = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_fproltt9")
        else{
            throw TopMoviesFetcherError.invalidURL
        }
        
        async let (moviesData, _) = URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let dataTopMovies = try await decoder.decode(ModelTopMovies.self, from: moviesData)
            
            print("Tengo datos:\(dataTopMovies)")
        
        self.arrayTopMovies = dataTopMovies.items
            
        }catch{
            
            print("error:\(TopMoviesFetcherError.missingData)")
        }
    }
}
