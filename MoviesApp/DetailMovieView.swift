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
        
        
        Text(modelDetailMovie.model?.title ?? "No data")
            .navigationTitle("Detail Movie")
            .task {
                await modelDetailMovie.fechtDataDetailMovie(id: id)
            }
    }
}


struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
