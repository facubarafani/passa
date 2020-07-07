//
//  EventCardView.swift
//  Passa
//
//  Created by Facundo Barafani on 07/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI
import Firebase

struct EventCardView: View {
    
    var event: Event
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }
    
    var body: some View {
        VStack{
            Image("event-default")
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            Image(systemName: "info.circle.fill")
                                .font(Font.title.weight(.light))
                                .foregroundColor(Color.white)
                                .imageScale(.small)
                                .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
                                .padding(.trailing,20)
                                .padding(.top,22)
                            Spacer()
                        }
                    }
            )
            VStack(alignment: .leading, spacing: 12) {
                Text(event.name)
                    .font(.system(.title,design:.serif))
                    .fontWeight(.bold)
                    .lineLimit(1)
                
                Text(event.description)
                    .font(.system(.body,design:.serif))
                    .foregroundColor(Color.gray)
                    .italic()
                
                HStack(alignment: .center, spacing: 15){
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text(event.location)
                    }
                    HStack{
                        Image(systemName: "calendar")
                        Text(dateFormatter.string(from: event.date.dateValue()))
                    }
                }
            }
            .padding(10)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray, radius: 8, x: 0, y: 0)
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(event: Event(id: 0, name: "Hernan Cattaneo @Forja", description:"Que lo que",location: "Forja",date: Timestamp(date: Date())))
            .previewLayout(.sizeThatFits)
    }
}
