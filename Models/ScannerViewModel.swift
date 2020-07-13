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
        self.lastQrCode = code
    }
}
