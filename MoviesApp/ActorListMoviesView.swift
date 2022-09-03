//
//  ActorListMoviesView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 13/8/22.
//

import SwiftUI

struct ActorListMoviesView: View {
    
     @State var listMovies: [ListMovies]
    
    var body: some View {
       
        ScrollView(.horizontal){
            HStack(alignment: .center){
                ForEach(listMovies){ listMovie in
                    VStack(alignment: .center, spacing: 20){
                        AsyncImage(url: URL(string: listMovie.image)){ image in
                            image.resizable()
                        }placeholder:{
                            ProgressView()
                        }
                        .frame(width:90,height: 150, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 3))
                      
                    
                        Text(listMovie.title)
                            .font(.system(size:14, weight: .light, design: .rounded))
                            .foregroundColor(.gray)
                            
                    }
                    
                        
                   
                }
            }
        }
        
    }
}

