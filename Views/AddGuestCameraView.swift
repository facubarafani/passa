//
//  AddGuestCameraView.swift
//  Passa
//
//  Created by Facundo Barafani on 19/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI

struct AddGuestCameraView: View {
    
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

struct AddGuestCameraView_Previews: PreviewProvider {
    static var previews: some View {
        AddGuestCameraView()
    }
}
