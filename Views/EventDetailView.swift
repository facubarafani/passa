//
//  EventDetailView.swift
//  Passa
//
//  Created by Facundo Barafani on 06/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
    let eventName: String?
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarTitle(eventName!)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventName: "Evento")
    }
}
