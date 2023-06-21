//  PreviousInstructions.swift
//  meditar
//  Created by Losark on 20/6/23.

import SwiftUI

struct PreviousInstructions: View {
    @State private var currentPage = 0
    
    var body: some View {
        ZStack {
            Color.morado.edgesIgnoringSafeArea(.vertical)
            LinearGradient(gradient: Gradient(colors: [.negro.opacity(0.4), .morado]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack {
                TabView(selection: $currentPage) {
                    VStack {
                        Text("Beneficios de meditar")
                            .font(.largeTitle)
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3)
                        
                        
                        Spacer()

                        
                            Text("La meditación ha sido practicada durante milenios y se ha asociado con una amplia gama de beneficios para la salud y el bienestar.")
                                .font(.system(size: 45))
                                .minimumScaleFactor(0.5)
                                .fontWeight(.heavy)
                                .opacity(0.5)
                                .foregroundColor(.blanco)
//                            .background(.red)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 30.0)
                    .padding(.top, 30.0)
                    .tag(0)
                    //.background(.red.opacity(0.5))
                    
                    Text("Página 2")
                        .tag(1)
                    Text("Página 3")
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
            
        }
    }
}

struct PreviousInstructions_Previews: PreviewProvider {
    static var previews: some View {
        PreviousInstructions()
    }
}
