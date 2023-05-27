//  BotonReutilizableView.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

struct BotonReutilizableView: View {
    var action: () -> Void
    var texto = "Ejemplo de botón"
    private let colorFondo = Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
    private let colorNivel = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Circle()
                    .fill(colorNivel)
                    .padding(.trailing)
                    .frame(width: 40, height: 40)
                
                Text(texto)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 12.0)
            .background(Capsule().fill(colorFondo))
//            .background(Capsule().fill(Color.gray))
        }
    }
}

struct BotonReutilizableView_Previews: PreviewProvider {
    static var previews: some View {
            BotonReutilizableView(action: {
                print("Botón reutilizable clicado")
            })
        }
}
