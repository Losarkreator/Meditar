//  ContentView.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct ContentView: View {
    @State private var imageOpacity: Double = 1.0 // Opacidad inicial
    @State private var activateAnimation = false
    @State private var gradientColors: [Color] = [Color.red, Color.blanco, Color.blanco]
    
    var body: some View {
        ZStack {
            Image("MeditIcon")
                .resizable()
                .scaledToFit()
                .colorMultiply(.red)
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom))
                .opacity(imageOpacity)
                .onTapGesture {
                    animateOpacity()
                }
                .mask(
                    Image("MeditIcon")
                        .resizable()
                        .scaledToFit()
            )
        }
    }
    
    func animateOpacity() {
        activateAnimation.toggle()
        if activateAnimation {
            withAnimation(.easeInOut(duration: 2.0)) {
                imageOpacity = 0.1
            }
        } else {
            withAnimation(.easeInOut(duration: 2.0)) {
                imageOpacity = 1.0
            }
        }
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
