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
                    NavigationLink(destination: DetailMovieView(id: data.id)){
                    LazyVStack{
                        
                        VStack(alignment: .center, spacing: 20){
                            Text(data.title)
                                .font(.title)
                            HStack{
                                Text("Ranking: \(data.rank)")
                                    .bold()
                                Spacer()
                                Text(data.year)
                                    .bold()
                            }
                        }
                        
                        ZStack(alignment: .bottomTrailing){
                            AsyncImage(url: URL(string:data.image)){ image in
                                
                                image.resizable()
                                
                            }placeholder:{
                                ProgressView()
                            }
                            .frame(width: 225, height: 350, alignment: .center)
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
                                
                                Text(data.imDBRating)
                                    .font(.title3)
                                    .padding()
                            }
                        }
                        Divider()
                        
                    }.listRowSeparator(.hidden)
                }
            }
            }
            .navigationTitle("Movies")
            
            .task {
                
                await dataMovies.fechDataTopMovies()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviesView()
    }
}
