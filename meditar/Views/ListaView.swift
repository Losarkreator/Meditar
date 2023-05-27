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
                        NavigationLink(destination: CountdownView(startingNumber: index)){
                            CustomCellView(item: index)
                        }
                        .listRowSeparatorTint(Color.clear)
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(PlainListStyle())
                .foregroundColor(.clear)
//                .background(Color.morado)
//                .background(Color.rojo.opacity(0.5))
//                .navigationTitle("Niveles: ")
        }
    }
    
}


struct ListaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaView()
    }
}
