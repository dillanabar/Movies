//
//  ContentView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 27/5/22.
//ls

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            List{
                ForEach((1...10).reversed(), id: \.self) { numero in
                    HStack{
                        ZStack(alignment: .bottomTrailing){
                        
                    Image(systemName: "photo.on.rectangle.angled")
                                .frame(width: 150, height: 300, alignment: .center)
                                .foregroundColor(.orange)
                    ZStack{
                        Circle()
                            .strokeBorder(.black, lineWidth: 1)
                            .background(Circle().fill(.orange))
                            .frame(width: 30 , height: 30, alignment: .center)
                            .foregroundColor(.orange)
                            
                    Text("\(numero)")
                        .padding()
                    }
                    }
                        Text("Se centra en Obi-Wan Kenobi 10 años después del final de las Guerras Clon, donde enfrentó su mayor derrota; la caída y corrupción de su mejor amigo y aprendiz de Jedi, Anakin Skywalker se convirtió en el malvado Lord Sith Darth Vader.")
                    }
                }
            }.navigationTitle("Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
