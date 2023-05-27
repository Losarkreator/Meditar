//  NivelesView.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct NivelesView: View {
    private let colorFondo = Color.morado
    @State var isNiveles = true
    
    var body: some View {
        VStack(alignment: .leading) {
            if isNiveles {
                Text("Niveles: ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 50.0)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            }
            
            ListaView()
            
        }
        .background(colorFondo)
        

        
    }
}

struct NivelesView_Previews: PreviewProvider {
    static var previews: some View {
        NivelesView()
    }
}
