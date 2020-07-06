//
//  CreateEventView.swift
//  Passa
//
//  Created by Facundo Barafani on 01/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI
import Firebase
import AVFoundation

struct CreateEventView: View {
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    @State var eventName: String = ""
    @State var eventDescription: String = ""
    @State private var eventDate = Date()
    let db = Firestore.firestore();
    
    var body: some View {
        Form {
            HStack{
        Image(systemName: "a");
                TextField("Nombre del evento",text: $eventName)
            }
                HStack{
            Image(systemName: "text.justify");
                    TextField("Descripcion del evento",text: $eventDescription)
                }
            DatePicker("Fecha del evento", selection: $eventDate,in: Date()..., displayedComponents: .date)
        }
    .navigationBarTitle("Nuevo evento")
        .navigationBarItems(trailing: Button(action: {
            self.postEvent()
        }, label: {Text("Crear")})
        
        )
    }
    
    func postEvent(){
        db.collection("events").addDocument(data: [
            "name": eventName,
            "description": eventDescription,
            "date": eventDate,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
    
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
