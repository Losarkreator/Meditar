//  ContentView.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

struct ContentView: View {
    @State private var currentPage = 0
    
    var body: some View {
        
        ZStack {
            
            Color.morado.opacity(0.5).edgesIgnoringSafeArea(.vertical)
            
            VStack {
                TabView(selection: $currentPage) {
                    VStack {
                    //TODO: Cambiar ilustracion
                        Image("MeditIcon")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        //TODO: Cambiar Texto
                        Text("Texto de la primera página")
                    }
                    .tag(0)
                    
                    Text("Página 2")
                        .tag(1)
                    Text("Página 3")
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                
//                PageControl(numberOfPages: 3, currentPage: $currentPage)
//                    .padding()
            }
        }
    }
}

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages) { page in
                Circle()
                    .fill(page == currentPage ? Color.blanco : Color.gray)
                    .frame(width: 10, height: 10)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
