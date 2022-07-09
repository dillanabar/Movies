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
    
    @Published var  arrayTopMovies = [Item]()
    @Published var isFetching = false
    
    func fechDataTopMovies() async  {
        
        guard let url = URL(string: "https://imdb-api.com/es/API/Top250Movies/k_fproltt9")
        else{ fatalError("ErrorUrl") }
        do {
            isFetching = true
            let (moviesData,_) = try await URLSession.shared.data(from: url)
            
            print(moviesData)
            let decoder = JSONDecoder()
            let dataMovies = try decoder.decode(ModelTopMovies.self, from: moviesData)
            DispatchQueue.main.async {
                self.arrayTopMovies = dataMovies.items
            }
            
            
        }catch{
            DispatchQueue.main.async {
                self.isFetching = false
                print("error:\(TopMoviesFetcherError.missingData)")
            }
            
            
        }
    }
    
}

