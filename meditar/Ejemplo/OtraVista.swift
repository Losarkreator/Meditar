//
//  OtraVista.swift
//  meditar
//
//  Created by Losark on 31/5/23.
//

import SwiftUI

struct OtraVista: View {
    let nivel: String
    let color: Color
    let tiempo: Int
    
    var body: some View {
        VStack {
            Circle()
                .fill(color)
                .frame(width: 100, height: 100)
            
            Text(nivel)
                .font(.title)
                .padding()
            
            Text("Tiempo: \(tiempo)")
        }
    }
}


struct OtraVista_Previews: PreviewProvider {
    static var previews: some View {
        OtraVista(nivel: "Nivel", color: Color.rojo, tiempo: 5)
    }
}
