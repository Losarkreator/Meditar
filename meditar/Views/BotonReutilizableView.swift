//  BotonReutilizableView.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

struct BotonReutilizableView: View {
    var action: () -> Void
    var texto = "Ejemplo de botón"
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Text(texto)
                    .font(.title)
                    .foregroundColor(Color.white)
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 12.0)
            .background(Capsule().fill(Color.gray))
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
