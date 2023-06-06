//
//  SplashScreenView.swift
//  meditar
//
//  Created by Losark on 6/6/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            LevelsView()
        } else {
            ZStack {
                Color.morado.ignoresSafeArea()
                
                VStack {
                    // Logo y texto
                    VStack {
                        Image("MeditIcon")
                        Text("Meditar")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blanco)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
