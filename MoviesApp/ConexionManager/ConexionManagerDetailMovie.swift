//
//  ConexionManagerDetailMovie.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 11/6/22.
//

import Foundation
import SwiftUI


final class ConexionManagerDetailMovie: ObservableObject  {
    
    @Published var model: ModelDetailMovie?
    
    func fechtDataDetailMovie(id: String) async {
        guard let url = URL(string: "https://imdb-api.com/es/API/Title/k_fproltt9/" + id)
        else { fatalError("Error Url")}
        
        do {
            let (dataDetailMovie, _) = try await URLSession.shared.data(from: url)
            print(dataDetailMovie)
            let decoder = JSONDecoder()
            let model = try decoder.decode(ModelDetailMovie.self, from: dataDetailMovie)
            DispatchQueue.main.async {
                self.model = model
            }
        } catch  {
            print("Error en datos: \(error.localizedDescription)")
        }
        
        
    }
    
  
    
}
