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
    var body: some View {
        VStack {
            Text("Events View")
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
