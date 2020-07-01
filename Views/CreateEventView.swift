//
//  CreateEventView.swift
//  Passa
//
//  Created by Facundo Barafani on 01/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI

struct CreateEventView: View {
    var body: some View {
        Form {
            HStack{
        Image(systemName: "a");
                TextField("Nombre del evento",text:.constant(""))
            }
                HStack{
            Image(systemName: "text.justify");
                    TextField("Descripcion del evento",text:.constant(""))
                }
            HStack {
            Image(systemName: "calendar");
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Fecha del evento") })
            }
        }
    .navigationBarTitle("Nuevo evento")
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
