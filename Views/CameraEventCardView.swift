//
//  CameraEventCardView.swift
//  Passa
//
//  Created by Facundo Barafani on 17/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI
import Firebase

struct CameraEventCardView: View {
    
    var event: Event
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 12) {
                Text(event.name)
                    .foregroundColor(Color.black)
                
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

struct CameraEventCardView_Previews: PreviewProvider {
    static var previews: some View {
        CameraEventCardView(event: Event(id: "xd", name: "Hernan Cattaneo @Forja", description:"Que lo que",location: "Forja",date: Timestamp(date: Date()),attendants: [Attendant]()))
            .previewLayout(.sizeThatFits)
    }
}
