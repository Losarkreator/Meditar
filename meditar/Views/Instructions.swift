//  Instructions.swift
//  meditar
//  Created by Losark on 20/6/23.

import SwiftUI

struct Instructions: View {
    var body: some View {
        ZStack {
            Color.amarillo
                .edgesIgnoringSafeArea(.vertical)
//            LinearGradient(gradient: Gradient(colors: [.amarillo, .negro.opacity(0.2)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Instrucciones")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
//                    .padding(.top, 70.0)
                    .padding(.bottom, 60.0)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3)
                    .frame(alignment: .top)
                
                Spacer()
                
                //MARK: - Instrucciones
                VStack {
                    ZStack {
                        CustomNavigationButton(destination: Instructions())
                        Text("Beneficios")
                            .font(.title2)
                        //                        .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.negro)
                    }
                    
                    ZStack {
                        CustomNavigationButton(destination: Instructions())
                        Text("Instrucciones previas")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.negro)
                    }
                    
                    ZStack {
                        CustomNavigationButton(destination: Instructions())
                        Text("Meditación básica")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.negro)
                    }
                    
                    ZStack {
                        CustomNavigationButton(destination: Instructions())
                        Text("Anapanasati")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.negro)
                    }
                }
                
                Spacer()
                
                
            }
            .padding(.horizontal, 30.0)
            
            
        }
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
