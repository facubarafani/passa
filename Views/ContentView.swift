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
            ScrollView(.vertical,showsIndicators: false) {
                VStack (alignment: .center, spacing: 20){
                    ForEach(eventData.events) { item in
                    EventCardView(event: item)
                    }
                }
                .frame(maxWidth:640)
                .padding(.horizontal)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
