//  NivelesView.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct NivelesView: View {
    var body: some View {
        VStack {
            BotonReutilizableView(
                action: {
                    print("Botón reutilizable clicado")
                }, texto: "Nivel 1")
        }
    }
}

struct NivelesView_Previews: PreviewProvider {
    static var previews: some View {
        NivelesView()
    }
}
