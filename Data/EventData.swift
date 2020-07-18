//
//  EventData.swift
//  Passa
//
//  Created by Facundo Barafani on 07/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import Foundation
import Firebase

class EventData: ObservableObject {
    let db = Firestore.firestore();
    @Published var events = [Event]()
    
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
                            if let eventName = data["name"] as? String,let eventDescription = data["description"] as? String,let eventLocation = data["location"] as? String,let eventDate = data["date"] as? Timestamp {
                                let newEvent = Event(id:doc.documentID,name: eventName, description: eventDescription,location: eventLocation,date: eventDate,attendants: [Attendant]())
                                self.events.append(newEvent)
                            }
                        }
                    }
                }
        }
    }
    
}
