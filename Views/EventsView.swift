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
    @State var events: [Event] = []
    var body: some View {
        List(events) { event in
            HStack {
                Text(event.name)
            }
        }
        .onAppear {
            self.getEvents()
        }
        .navigationBarTitle("Eventos")
        .navigationBarItems(
            trailing:
            NavigationLink(destination: CreateEventView()) {
                Image(systemName: "plus")
        })
    }
    func getEvents(){
        db.collection("events")
            .addSnapshotListener { (querySnapshot, error) in
                self.events = []
                if let e = error {
                    print(e)
                }
                else {
                    if let snapshotDocuments = querySnapshot?.documents{
                        for doc in snapshotDocuments{
                            let data = doc.data()
                            if let eventName = data["name"] as? String,let eventDescription = data["description"] as? String{
                                let newEvent = Event(id:self.events.count,name: eventName, description: eventDescription)
                                self.events.append(newEvent)
                                
                            }
                        }
                    }
                }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
