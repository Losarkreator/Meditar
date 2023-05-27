//  CustomCellView.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

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

struct CustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCellView(item: 1)
    }
}
