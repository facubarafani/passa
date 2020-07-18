//
//  ScannerViewModel.swift
//  Passa
//
//  Created by Facundo Barafani on 13/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import Foundation
import Firebase

class ScannerViewModel: ObservableObject {
    let db = Firestore.firestore();
    /// Define que tan seguido vamos a escanear nuevos codigos
    let scanInterval: Double = 1.0
    
    @Published var torchIsOn: Bool = false
    @Published var lastQrCode: String = ""
    @Published var scannedAttendant: Attendant?
    
    
    func onFoundQrCode(_ code: String) {
        let editedText = code.replacingOccurrences(of: "@", with: "\n")
        let attendant = editedText.components(separatedBy: "\n")
        let newAttendant = Attendant(name: attendant[2], surname: attendant[1], gender: attendant[3], birthdate: attendant[5])
        
        self.lastQrCode = "\(newAttendant.name)  \(newAttendant.surname)"
        print("\(newAttendant.name)  \(newAttendant.surname)")
        
        self.scannedAttendant = newAttendant
        
    }
    
    func pushAttendant(_ id: String){
        db.collection("events").document(id).collection("guests").addDocument(data : [
            "name": scannedAttendant?.name,
            "surname": scannedAttendant?.surname,
            "birthdate": scannedAttendant?.birthdate,
            "gender": scannedAttendant?.gender
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
    
}
