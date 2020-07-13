//
//  ScannerViewModel.swift
//  Passa
//
//  Created by Facundo Barafani on 13/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import Foundation

class ScannerViewModel: ObservableObject {
    
    /// Define que tan seguido vamos a escanear nuevos codigos
    let scanInterval: Double = 1.0
    
    @Published var torchIsOn: Bool = false
    @Published var lastQrCode: String = "Qr-code goes here"
    
    
    func onFoundQrCode(_ code: String) {
        let editedText = code.replacingOccurrences(of: "@", with: "\n")
        let attendant = editedText.components(separatedBy: "\n")
        let newAttendant = Attendant(name: attendant[2], surname: attendant[1], gender: attendant[3], birthdate: attendant[5])
        self.lastQrCode = code
    }
}
