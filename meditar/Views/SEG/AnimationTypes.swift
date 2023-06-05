//  AnimationTypes.swift
//  meditar
//  Created by Losark on 5/6/23.

import SwiftUI

struct AnimationView: View {
    @State private var width: CGFloat = 300
    var animation: Animation
    var nombre = "Nombre"
    
    var body: some View {
        Text(nombre)
            .padding()
            .background(        Capsule()
                .foregroundColor(.azul)
                .frame(width: width, height: 50)
                .onAppear(perform: {
                    withAnimation(animation.repeatForever()){
                        width = 10
                    }
                }))
    }
}


struct AnimationTypes: View {
    var body: some View {
        VStack {
            AnimationView(animation: .linear, nombre: "linear")
            AnimationView(animation: .linear(duration: 1.0), nombre: "linearDuration")
            AnimationView(animation: .default, nombre: "default")
            Divider()
                .padding()
            AnimationView(animation: .easeIn, nombre: "easeIn")
            AnimationView(animation: .easeOut, nombre: "easeOut")
            AnimationView(animation: .easeInOut, nombre: "easeInOut")
            Divider()
                .padding()
            AnimationView(animation: .spring(), nombre: "spring")
            AnimationView(animation: .interactiveSpring(), nombre: "interactiveSpring")
        }
    }
}

struct AnimationTypes_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTypes()
    }
}
