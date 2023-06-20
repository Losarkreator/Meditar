//  Benefits.swift
//  meditar
//  Created by Losark on 20/6/23.

import SwiftUI

struct Benefits: View {
    @State private var currentPage = 0
    let paddinBottom = 40.0
    
    var body: some View {
        ZStack {
            Color.morado.edgesIgnoringSafeArea(.vertical)
            LinearGradient(gradient: Gradient(colors: [.negro.opacity(0.2), .morado]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack {
                TabView(selection: $currentPage) {
                    
                    VStack {
                        benefitSubview(titulo: "Empatía y compasión", texto: "Al cultivar la conciencia plena y la autocompasión, la meditación puede promover actitudes de empatía y compasión hacia uno mismo y hacia los demás. Esto puede fortalecer las relaciones interpersonales y promover un mayor bienestar emocional.")
                        
                        benefitSubview(titulo: "Mejora la calidad del sueño", texto: "La meditación puede ser útil para promover un sueño más reparador. Al reducir el estrés y calmar la mente, puede ayudar a conciliar el sueño más fácilmente y mejorar la calidad del descanso nocturno.", textoTrailing: true)
                        
                    }
                    .padding(.bottom, paddinBottom)
                    .tag(0)
                    
                    
                    benefitSubview(titulo: "Beneficios de meditar", texto: "La meditación ha sido practicada durante milenios y se ha asociado con una amplia gama de beneficios para la salud y el bienestar.")
                        .padding(.bottom, paddinBottom)
                        .tag(0)
                    
                    VStack {
                        benefitSubview(titulo: "Reducción del estrés", texto: "La meditación es conocida por su capacidad para reducir el estrés y promover la relajación. Puede ayudar a disminuir la respuesta del cuerpo al estrés, reducir la ansiedad y mejorar el estado de ánimo.")
                        
                        benefitSubview(titulo: "Mejora la concentración", texto: "La práctica regular de la meditación puede fortalecer la atención y mejorar la concentración. Esto puede ser beneficioso tanto en el trabajo como en el estudio, ayudándote a mantenerte más enfocado y productivo.", textoTrailing: true)
                        
                    }
                    .padding(.bottom, paddinBottom)
                    .tag(1)
                    
                    VStack {
                        benefitSubview(titulo: "Salud mental", texto: "La meditación se ha relacionado con una mejora de la salud mental en general. Puede ayudar a reducir los síntomas de depresión, ansiedad y trastornos relacionados. Además, puede promover la autoconciencia y la autorregulación emocional.")
                        
                        benefitSubview(titulo: "Mejora la toma de decisiones", texto: "La práctica de la meditación puede llevar a una mayor claridad mental y una mayor capacidad para tomar decisiones informadas y conscientes. Al calmar la mente y reducir la rumiación, puedes experimentar una mayor claridad y perspectiva en tu vida.", textoTrailing: true)
                        
                    }
                    .padding(.bottom, paddinBottom)
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
            .padding(.horizontal, 30.0)
            .padding(.top, 30.0)
        }
        
    }
}

//MARK: - Subviews
struct benefitSubview: View {
    @State var titulo: String
    @State var texto: String
    @State var textoTrailing: Bool = false
    
    
    var body: some View {
        VStack {
            Text(titulo)
                .font(.largeTitle)
                .lineLimit(1)
                .minimumScaleFactor(0.2)
                .fontWeight(.bold)
                .foregroundColor(Color.blanco)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3)
            
            Spacer()
            
            Text(texto)
                .font(.system(size: 40))
                .minimumScaleFactor(0.2)
                .fontWeight(.bold)
                .multilineTextAlignment(textoTrailing ? .trailing : .leading)
                .opacity(0.6)
                .foregroundColor(.blanco)
            Spacer()
            
        }
        .padding(.top, 30.0)
    }
}




struct Benefits_Previews: PreviewProvider {
    static var previews: some View {
        Benefits()
    }
}
