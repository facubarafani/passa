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
                            if let eventName = data["name"] as? String,let eventDescription = data["description"] as? String{
                                let newEvent = Event(id:self.events.count,name: eventName, description: eventDescription,location: "Forja")
                                self.events.append(newEvent)
                                
                            }
                        }
                    }
                }
        }
    }
    
}
