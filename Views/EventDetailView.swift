//
//  EventDetailView.swift
//  Passa
//
//  Created by Facundo Barafani on 06/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI
import Firebase

struct EventDetailView: View {
    let eventName: String?
    let eventDescription: String?
    let eventLocation: String?
    let eventDate: Timestamp?
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }
    
    var body: some View {
        ScrollView {
            VStack{
                Image("event-default")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        HStack{
                            VStack(alignment: .leading){
                                Spacer()
                                Text(eventName!)
                                    .font(Font.title.weight(.bold))
                                    .foregroundColor(Color.white)
                                    .padding()
                            }
                            Spacer()
                        }
                )
                VStack(){
                    HStack{
                        Image(systemName: "info.circle")
                        Text("Descripción")
                            .font(Font.title.weight(.light))
                            .foregroundColor(Color.gray)
                    }
                    Text(eventDescription!)
                }
                Divider()
                VStack(){
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text("Ubicación")
                            .font(Font.title.weight(.light))
                            .foregroundColor(Color.gray)
                    }
                    Text(eventLocation!)
                }
                Divider()
                VStack(){
                    HStack{
                        Image(systemName: "calendar")
                        Text("Fecha")
                            .font(Font.title.weight(.light))
                            .foregroundColor(Color.gray)
                    }
                    Text(dateFormatter.string(from: (eventDate?.dateValue())!))
                }
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventName: "Hernan Cattaneo",eventDescription: "Evento de alto nivel en el Complejo Forja donde se presentaran Hernan Cattaneo junto a Nick Warren.",eventLocation: "Forja Cordoba, Argentina",eventDate: Timestamp(date: Date()))
    }
}
