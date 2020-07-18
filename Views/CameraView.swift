//
//  CameraView.swift
//  Passa
//
//  Created by Facundo Barafani on 26/06/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    @ObservedObject var viewModel = ScannerViewModel()
    var eventAttendants = [Attendant]()
    var eventId: String?
    @State var selectedEvent: Event?
    @ObservedObject var eventData = EventData()
    
    var body: some View {
        ZStack {
            QrCodeScannerView()
            .found(r: self.viewModel.onFoundQrCode)
            .torchLight(isOn: self.viewModel.torchIsOn)
            .interval(delay: self.viewModel.scanInterval)
            VStack {
                VStack {
                    Text("Ubica el DNI en la pantalla")
                        .font(.subheadline)
                    Text(self.viewModel.lastQrCode)
                        .bold()
                        .lineLimit(5)
                        .padding()
                }
                .padding(.vertical, 20)
                Button(action: {
                    self.viewModel.pushAttendant(self.selectedEvent!.id)
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack (alignment: .center, spacing: 20){
                        ForEach(eventData.events) { item in
                            GeometryReader { geometry in
                                CameraEventCardView(event: item)
                                    .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX)-15) / -30), axis: (x: 0, y: 10, z: 0))
                                .onTapGesture {
                                    self.selectedEvent = item
                                  }
                            }
                        }
                    }
                    .frame(width: 200, height: 70)
                    .padding(15)
                    .onAppear {
                        self.eventData.getEvents()
                    }
                }
                HStack {
                    Button(action: {
                        self.viewModel.torchIsOn.toggle()
                    }, label: {
                        Image(systemName: self.viewModel.torchIsOn ? "bolt.fill" : "bolt.slash.fill")
                            .imageScale(.large)
                            .foregroundColor(self.viewModel.torchIsOn ? Color.yellow : Color.blue)
                            .padding()
                    })
                }
                .background(Color.white)
                .cornerRadius(10)
                
            }.padding()
        }
    }
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
