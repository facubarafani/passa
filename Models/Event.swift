//
//  Event.swift
//  Passa
//
//  Created by Facundo Barafani on 06/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import Foundation
import Firebase

struct Event: Identifiable{
    var id: Int
    let name: String
    let description: String
    let location: String
    let date: Timestamp
}
