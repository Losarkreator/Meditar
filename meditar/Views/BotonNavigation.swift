//  OtraVista.swift
//  meditar
//  Created by Losark on 31/5/23.

import SwiftUI

struct BotonNavigation: View {
    var modeloDeDatos: ModeloDatos
    var destination: VistaDestino
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Circle()
                    .fill(modeloDeDatos.color)
                    .padding(.trailing)
                    .frame(width: 40, height: 40)
                
                Text("\(modeloDeDatos.nivel): \(modeloDeDatos.tiempo) minutos")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Spacer()
                
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 12.0)
            .background(Capsule().fill(Color.blanco).shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5))
        }
    }
}

struct BotonNavigation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let modeloVista = ModeloVista()
            BotonNavigation(modeloDeDatos: modeloVista.intermedio, destination: VistaDestino(modeloDeDatos: modeloVista.intermedio))
        }
    }
}
