//
//  DetailMovieView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 9/6/22.
//

import SwiftUI

struct DetailMovieView: View {
    @State var id = ""
    var body: some View {
        Text(id)
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
