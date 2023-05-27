//  ListaView.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

struct ListaView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(0..<6) { index in
                        NavigationLink(destination: DetailView(item: index)) {
                            CustomCellView(item: index)
                        }
                        .listRowSeparatorTint(Color.clear)
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(PlainListStyle())
                .foregroundColor(.clear)
                .background(Color.rojo)
//                .navigationTitle("Niveles: ")
        }
    }
    
}

struct CustomCellView: View {
    private let colorNivel = Color(#colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 1))
    private let textoNivel = "Nivel "
    let item: Int
    
    var body: some View {
        
        HStack {
            Circle()
                .fill(colorNivel)
                .padding(.trailing)
                .frame(width: 40, height: 40)
            
            Text("\(textoNivel) \(item + 1) minuto")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }
        .padding(.horizontal, 24.0)
        .padding(.vertical, 12.0)
        .background(
            Capsule()
                .fill(Color.blanco)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct DetailView: View {
    let item: Int
    
    var body: some View {
        Text("Detalle del elemento \(item + 1)")
            .font(.title)
            .padding()
    }
}


struct ListaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaView()
    }
}
