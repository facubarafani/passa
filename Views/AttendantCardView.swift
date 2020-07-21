//
//  AttendantCardView.swift
//  Passa
//
//  Created by Facundo Barafani on 21/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI

struct AttendantCardView: View {
    
    var attendant: Attendant
    let colors = Gradient(colors: [Color(.systemBlue),Color(.systemTeal)])
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(.systemGray5))
                    .frame(width: 100, height: 100)
                    .padding()
                    .overlay(
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width:70,height: 70)
                )
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Apellido")
                            .foregroundColor(Color(.systemGray6))
                        Text(attendant.surname)
                    }
                    VStack(alignment: .leading){
                        Text("Nombre")
                            .foregroundColor(Color(.systemGray6))
                        Text(attendant.name)
                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("Fecha de nacimiento")
                                .foregroundColor(Color(.systemGray6))
                            Text(attendant.birthdate)
                        }
                        VStack{
                            Text("Genero")
                                .foregroundColor(Color(.systemGray6))
                            Text(attendant.gender)
                        }
                    }
                }
                .padding(10)
            }
            VStack(alignment: .leading){
                Text("DNI")
                    .foregroundColor(Color(.systemGray6))
                Text("42855584")
            }
            .padding(.leading)
        }
        .background(LinearGradient(gradient: colors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(15)
    }
}

struct AttendantCardView_Previews: PreviewProvider {
    static var previews: some View {
        AttendantCardView(attendant: Attendant(name: "FACUNDO", surname: "BARAFANI", gender: "M", birthdate: "19/10/2000"))
            .previewLayout(.sizeThatFits)
    }
}
