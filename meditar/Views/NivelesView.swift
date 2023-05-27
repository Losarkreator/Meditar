//  NivelesView.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct NivelesView: View {
    private let colorFondo = Color(#colorLiteral(red: 0.6078431373, green: 0.3176470588, blue: 0.8784313725, alpha: 1))
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(colorFondo)
                .ignoresSafeArea()
            
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
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .ignoresSafeArea()
//        .background(colorFondo)
        
    }
}

struct NivelesView_Previews: PreviewProvider {
    static var previews: some View {
        NivelesView()
    }
}
