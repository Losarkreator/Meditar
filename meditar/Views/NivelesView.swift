//  NivelesView.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct NivelesView: View {
    private let colorFondo = Color(#colorLiteral(red: 0.7965434194, green: 0.8816905618, blue: 0.9133130908, alpha: 1))
    
    var body: some View {
        
        VStack(alignment: .leading) {
            BotonReutilizableView(
                action: {
                    print("Botón reutilizable clicado")
                }, texto: "Principiante: 5''")
            
            BotonReutilizableView(
                action: {
                    print("Botón reutilizable clicado")
                }, texto: "Intermedio: 15''")
            BotonReutilizableView(
                action: {
                    print("Botón reutilizable clicado")
                }, texto: "Experto: 30''")
            BotonReutilizableView(
                action: {
                    print("Botón reutilizable clicado")
                }, texto: "Novicio: 1h")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(colorFondo)
        
    }
}

struct NivelesView_Previews: PreviewProvider {
    static var previews: some View {
        NivelesView()
    }
}
