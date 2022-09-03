//
//  ActorInfView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 4/8/22.
//

import SwiftUI

struct ActorInfView: View {
    
    @State var id = ""
    
    @ObservedObject var modelManagerActorInfo = ConexionActorInf()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            
            if let image = modelManagerActorInfo.model?.image{
                AsyncImage(url: URL(string: image)){ image in
                    image.resizable()
                }placeholder:{
                    ProgressView()
                }
                .frame(width:200,height: 200, alignment: .center)
                .clipShape(Circle())
            }
            
            Text(modelManagerActorInfo.model?.name ?? "No mame")
                .font(.title)
                .bold()
            Divider()
                .padding()
            Text(modelManagerActorInfo.model?.summary ?? "No Data")
                .font(.body)
                .foregroundColor(.gray)
                .bold()
                .padding()
            Divider()
                .padding()
            if let data = modelManagerActorInfo.model?.listMovies{
            ActorListMoviesView(listMovies: data)
            }
            Spacer()
                .navigationTitle("Actor Info")
                .task {
                    await modelManagerActorInfo.fechtDataDetailActorInfo(id: id)
                }
        }
    }
}

struct ActorInfView_Previews: PreviewProvider {
    static var previews: some View {
        ActorInfView()
    }
}
