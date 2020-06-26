//
//  ContentView.swift
//  Passa
//
//  Created by Facundo Barafani on 26/06/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Text("Home")
                .navigationBarTitle("Passa")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
