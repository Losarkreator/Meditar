//  LevelsView.swift
//  meditar
//  Created by Losark on 29/5/23.

import SwiftUI

struct LevelsView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                //MARK: - Color del fondo
                Color.morado.edgesIgnoringSafeArea(.all)
                LinearGradient(gradient: Gradient(colors: [.morado, .negro.opacity(0.2)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    //MARK: - Titulo
                    Text("Niveles: ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 70.0)
                        .padding(.bottom, 60.0)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    //MARK: - Lista de niveles
                    VStack {
                        LevelViewNavigationButton(levelModel: LevelModel(id: 1, level: .principiante, color: Color.rojo, tiempo: 5), destination: CountdownView(startingNumber: 5))
                        
                        LevelViewNavigationButton(levelModel: LevelModel(id: 2, level: .intermedio, color: Color.orange, tiempo: 15), destination: CountdownView(startingNumber: 15))
                        
                        LevelViewNavigationButton(levelModel: LevelModel(id: 3, level: .experto, color: Color.amarillo, tiempo: 30), destination: CountdownView(startingNumber: 30))
                        
                        LevelViewNavigationButton(levelModel: LevelModel(id: 1, level: .maestro, color: Color.green, tiempo: 60), destination: CountdownView(startingNumber: 60))
                        
                        LevelViewNavigationButton(levelModel: LevelModel(id: 1, level: .lama, color: Color.azul, tiempo: 120), destination: CountdownView(startingNumber: 120))
                    }
                    Spacer()
                }
                .padding(/*@START_MENU_TOKEN@*/.horizontal, 30.0/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}

struct NivelesTest_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
