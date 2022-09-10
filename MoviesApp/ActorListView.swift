//
//  ActorView.swift
//  MoviesApp
//
//  Created by Daniel Illana Bargueño on 18/6/22.
//

import SwiftUI

struct ActorListView: View {
    @State var actorList: [ActorList]
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading){
                ForEach(actorList){ actorList in
                    HStack(alignment: .center, spacing: 20){
                        NavigationLink(destination: ActorInfView(id: actorList.id)){
                            AsyncImage(url: URL(string: actorList.image)){ image in
                                image.resizable()
                            }placeholder:{
                                ProgressView()
                            }
                            .frame(width:90,height: 90, alignment: .center)
                            .clipShape(Circle())
                        }
                        VStack(alignment: .leading, spacing: 5){
                            Text(actorList.name)
                                .font(.system(size:14, weight: .bold, design: .rounded))
                                .bold()
                            Text(actorList.asCharacter)
                                .font(.system(size:10, weight: .bold, design: .rounded))
                                .foregroundColor(.gray)
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                }
            }
        }
        
    }
}


struct ActorView_Previews: PreviewProvider {
    static var previews: some View {
        ActorListView(actorList: demoActorList)
    }
}
