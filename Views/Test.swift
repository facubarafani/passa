//
//  Test.swift
//  Passa
//
//  Created by Facundo Barafani on 08/07/2020.
//  Copyright © 2020 Facundo Barafani. All rights reserved.
//

import SwiftUI

struct Test: View {
    var body: some View {
        Raindrop()
        .stroke(lineWidth: 4)
            .frame(width: 200, height: 200)
    }
}

struct Raindrop: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.size.width, y: rect.size.height))
            path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: rect.size.height), control: CGPoint(x: 0, y: 0))
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
