//
//  ContentView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 27/5/22.
//

import SwiftUI

struct TopMoviesView: View {
    
    @ObservedObject var dataMovies = ConexionManagerTopMovies()
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(dataMovies.arrayTopMovies) { data in
                    LazyVStack{
                        ZStack(alignment: .bottomTrailing){
                            AsyncImage(url: URL(string:data.image)){ image in
                                
                                image.resizable()
                                
                            }placeholder:{
                                ProgressView()
                            }
                            .frame(width: 200, height: 300, alignment: .center)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3))
                            .padding()
                            ZStack{
                                Circle()
                                    .strokeBorder(.black, lineWidth: 3)
                                    .background(Circle().fill(.orange))
                                    .frame(width: 40 , height: 40, alignment: .center)
                                    .foregroundColor(.orange)
                                
                                Text("9.6")
                                    .font(.title3)
                                    .padding()
                            }
                        }
                        VStack(alignment: .center, spacing: 10){
                            Text("Obi-Wan Kenobi")
                                .font(.title)
                            Divider()
                            HStack{
                                Text("Ranking \(data.rank)")
                                    .bold()
                                Spacer()
                                Text("2022")
                                    .bold()
                            }
                            Text("Se centra en Obi-Wan Kenobi 10 años después del final de las Guerras Clon, donde enfrentó su mayor derrota; la caída y corrupción de su mejor amigo y aprendiz de Jedi, Anakin Skywalker se convirtió en el malvado Lord Sith Darth Vader.")
                                .font(.callout)
                        }
                    }.listRowSeparator(.hidden)
                }.task {
                    do {
                           
                        try await dataMovies.fechDataTopMovies()
                        
                       } catch {
                           print("Request failed with error: \(error)")
                       }
                       
                    
                }
            }.navigationTitle("Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviesView()
    }
}
