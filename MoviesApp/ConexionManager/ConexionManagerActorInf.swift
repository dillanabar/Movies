//
//  ConexionManagerActorInf.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 4/8/22.
//

import Foundation
final class ConexionActorInf: ObservableObject  {
    
    @Published var model: ModelActorInf?
    
    func fechtDataDetailActorInfo(id: String) async {
        guard let url = URL(string: "https://imdb-api.com/es/API/Name/k_fproltt9/" + id)
        else { fatalError("Error Url")}
        
        do {
            let (dataDetailMovie, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let model = try decoder.decode(ModelActorInf.self, from: dataDetailMovie)
            DispatchQueue.main.async {
                self.model = model
            }
        } catch  {
            print("Error en datos: \(error.localizedDescription)")
        }
        
        
    }
}
