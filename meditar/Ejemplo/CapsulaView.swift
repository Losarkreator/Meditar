//
//  CapsulaView.swift
//  meditar
//
//  Created by Losark on 31/5/23.
//

import SwiftUI

struct CapsulaView: View {
    let vista: VistaDatos
    @State private var isActive: Bool = false
    
    var body: some View {
        HStack {
            Circle()
                .fill(vista.color)
                .frame(width: 50, height: 50)
            
            Text(vista.nivel)
            
            Text("Tiempo: \(vista.tiempo)")
            
            Button(action: {
                isActive = true
            }) {
                Text("Ir a OtraVista")
            }
            .fullScreenCover(isPresented: $isActive, content: {
                vista.destino
            })
        }
    }
}

//struct CapsulaView_Previews: PreviewProvider {
//    static var previews: some View {
//        let vista: VistaDatos
//        CapsulaView(vista: vista)
//    }
//}
