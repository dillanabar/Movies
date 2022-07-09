//
//  TabbarView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 9/7/22.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            TopMoviesView().tabItem {
                VStack{
                    Image(systemName: "ticket")
                    Text("Movies")
                    
                } }.tag(1)
            Text("Tab Content 2").tabItem { VStack{
                Image(systemName: "tv")
                Text("TVs")
            }
            }.tag(2)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
