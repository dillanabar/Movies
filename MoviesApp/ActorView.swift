//
//  ActorView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 18/6/22.
//

import SwiftUI

struct ActorView: View {
    @State var actorList: [ActorList]
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .center){
                ForEach(actorList){ actorList in
                    VStack(alignment: .center, spacing: 20){
                        AsyncImage(url: URL(string: actorList.image)){ image in
                            image.resizable()
                        }placeholder:{
                            ProgressView()
                        }
                        .frame(width:90,height: 90, alignment: .center)
                        .clipShape(Circle())
                        Text(actorList.name)
                            .font(.caption)
                            .bold()
                    }
                   
                }
            }
        }
        
    }
}


struct ActorView_Previews: PreviewProvider {
    static var previews: some View {
        ActorView(actorList: demoActorList)
    }
}
