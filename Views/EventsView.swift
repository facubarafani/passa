//
//  EventsView.swift
//  Passa
//
//  Created by Facundo Barafani on 26/06/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI
import Firebase

struct EventsView: View {
    let db = Firestore.firestore();
    @ObservedObject var eventData = EventData()
    
    var body: some View {
        List(eventData.events) { event in
            NavigationLink(destination: EventDetailView(eventName: event.name,eventDescription: event.description,eventLocation: event.location,eventDate: event.date)) {
                VStack(alignment: .leading) {
                Text(event.name)
                    .bold()
                Text(event.description)
                    .italic()
                    .foregroundColor(Color.gray)
                }
            }
        }
        .onAppear {
            self.eventData.getEvents()
        }
        .navigationBarTitle("Eventos")
        .navigationBarItems(
            trailing:
            NavigationLink(destination: CreateEventView()) {
                Image(systemName: "plus")
        })
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
