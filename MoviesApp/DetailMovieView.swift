//
//  DetailMovieView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 9/6/22.
//

import SwiftUI

struct DetailMovieView: View {
    @State var id = ""
    @ObservedObject var modelDetailMovie = ConexionManagerDetailMovie()
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading){
                VStack(alignment: .center, spacing: 6){
                    
                    ZStack(alignment: .bottomTrailing){
                        if let image = modelDetailMovie.model?.image{
                            AsyncImage(url: URL(string:image)){ image in
                                image.resizable()
                            }placeholder:{
                                ProgressView()
                            }
                            .frame(width: 350, height: 425, alignment: .center)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3))
                            .padding()
                        }
                        ZStack{
                            Circle()
                                .strokeBorder(.black, lineWidth: 3)
                                .background(Circle().fill(.orange))
                                .frame(width: 60 , height: 60, alignment: .center)
                                .foregroundColor(.orange)
                            
                            Text(modelDetailMovie.model?.imDbRating ?? "0")
                                .font(.title)
                                .padding()
                        }
                    }
                    Text(modelDetailMovie.model?.title ?? "No data")
                        .font(.title)
                        .bold()
                    Text(modelDetailMovie.model?.plotLocal ?? modelDetailMovie.model?.plot ?? "No data")
                        .font(.body)
                    Divider()
                    HStack(alignment: .center, spacing: 10){
                        Text("Año:")
                            .bold()
                        Text(modelDetailMovie.model?.year ?? "No data")
                        Text("Duración:")
                            .bold()
                        Text((modelDetailMovie.model?.runtimeMins ?? "no data") + " min" )
                    }
                    Divider()
                    VStack(alignment: .center){
                        Text("Director")
                            .bold()
                        
                    }
                    Divider()
                }
                VStack(alignment: .leading,spacing: 10){
                    Text("Actores")
                        .font(.title)
                        .bold()
                        .padding()
                    if let actorList = modelDetailMovie.model?.actorList{
                        ActorListView(actorList: actorList)
                    }
                }
                
            }.padding(10)
            
            .navigationTitle("Detail Movie")
            .task {
                await modelDetailMovie.fechtDataDetailMovie(id: id)
            }
            
            
        }
        
    }
}



struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
