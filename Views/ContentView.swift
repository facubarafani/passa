//
//  ContentView.swift
//  Passa
//
//  Created by Facundo Barafani on 26/06/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var eventData = EventData()
    
    var body: some View {
        NavigationView{
            
            VStack {
                Text("Próximos Eventos")
                    .font(Font.title.weight(.bold))
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack (alignment: .center, spacing: 20){
                        ForEach(eventData.events) { item in
                            GeometryReader { geometry in
                                EventCardView(event: item)
                                    .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX)-15) / -30), axis: (x: 0, y: 10, z: 0))
                            }
                        }
                    }
                    .frame(width: 640, height: 480)
                    .padding(15)
                    .onAppear {
                        self.eventData.getEvents()
                    }
                    .navigationBarTitle("Passa",displayMode: .inline)
                    .navigationBarItems(
                        leading:
                        NavigationLink(destination: CameraView()) {
                            Image(systemName: "camera")
                        }
                        ,trailing:
                        NavigationLink(destination: EventsView()) {
                            Image(systemName: "list.dash")
                        }
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
