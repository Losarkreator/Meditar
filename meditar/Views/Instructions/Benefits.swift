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
                    
                    benefitSubview(titulo: "benefitsTitle_string", texto: "benefitsDescription_string")
                        .padding(.bottom, paddinBottom)
                        .tag(0)
                    
                    VStack {
                        benefitSubview(titulo: "stressReductionTitle_string", texto: "stressReductionDescription_string")
                        
                        benefitSubview(titulo: "improveConcentrationTitle_string", texto: "improveConcentrationDescription_string")
                    }
                    .padding(.bottom, paddinBottom)
                    .tag(1)
                    
                    VStack {
                        benefitSubview(titulo: "mentalHealthTitle_string", texto: "mentalHealthDescription_string")
                        
                        benefitSubview(titulo: "improveDecisionMakingTitle_string", texto: "improveDecisionMakingDescription_string")
                    }
                    .padding(.bottom, paddinBottom)
                    .tag(2)
                    
                    VStack {
                        benefitSubview(titulo: "empathyCompassionTitle_string", texto: "empathyCompassionDescription_string")
                        
                        benefitSubview(titulo: "improvedQleepQualityTitle_string", texto: "improvedQleepQualityDescription_string")
                        
                    }
                    .padding(.bottom, paddinBottom)
                    .tag(3)
                    
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
            HStack() {
                Text(NSLocalizedString(titulo, comment: ""))
                    .font(.largeTitle)
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blanco)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3)
                
                Spacer()
            }
            
            Spacer()

            Text(NSLocalizedString(texto, comment: ""))
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
            .environment(\.locale, Locale.init(identifier: "es"))
    }
}
