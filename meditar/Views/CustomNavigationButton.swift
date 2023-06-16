//  NavigationButtonExample.swift
//  meditar
//  Created by Losark on 29/5/23.

import SwiftUI

struct CustomNavigationButton: View {
    var destination: AnyView
    var texto: String?
    var colorCirculo: Color?
    var textoEspecial = true
    var colorTexto = Color.negro

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                //MARK: - Circulo
                if (colorCirculo != nil) {
                    Circle()
                        .fill(colorCirculo!)
                        .padding(.trailing)
                        .frame(width: 40, height: 40)
                } else {
                    Circle()
                        .fill(Color.blanco)
                        .padding(.trailing)
                        .frame(width: 40, height: 40)
                }
                
                //MARK: - Texto
                if !textoEspecial{
                    Text(texto ?? "")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(colorTexto)
                } else {
                    Spacer()
                    Text(texto ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorTexto)
                    Spacer()
                }
                
//                HStack {
//                    Spacer()
//                    Text("Siguiente")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.azul)
//                    Spacer()
//                }
//                .padding(.vertical, 20.0)
//                .background(Capsule().fill(Color.blanco)
//                    .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3))
//                .padding(32.0)
                
                
                Spacer()
                
            }
            .navigationTitle("Seleccionar duración")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .padding(.horizontal, 24.0)
            .padding(.vertical, 12.0)
            //MARK: - Fondo
            .background(Capsule().fill(Color.blanco).shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5))
        }
        
    }
}

struct AnotherView: View {
    var body: some View {
        VStack {
            Text("Otra pantalla")
                .font(.largeTitle)
        }
    }
}


struct CustomNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationButton(destination: AnyView(AnotherView()), texto: "Texto de prueba"
//                               ,textoEspecial: false
//                               ,colorTexto: Color.red
//                               , colorCirculo: Color.azulIndigo
        )
    }
}
