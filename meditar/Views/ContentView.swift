//  ContentView.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct ContentView: View {
    private let distancia = 10.0
    
    var body: some View {
        ZStack {
            //MARK: - Color del fondo
            Color.morado
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                //MARK: - Titulo
                Text("Niveles: ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top, 80.0)
                    .padding(.bottom, 60.0)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)

                //MARK: - Lista de niveles
                NavigationView {
                    VStack {
                        LevelViewNavigationButton(levelModel: LevelModel(id: 1, level: .principiante, color: Color.rojo, tiempo: 5), destination: CountdownView(startingNumber: 5))
                        /*
                        LevelView(levelModel: LevelModel(id: 1, level: .principiante, color: .red, tiempo: 5))
                            .padding(.vertical, distancia)
    
                        LevelView(levelModel: LevelModel(id: 2, level: .intermedio, color: .orange, tiempo: 15))
                            .padding(.vertical, distancia)
    
                        LevelView(levelModel: LevelModel(id: 3, level: .experto, color: .amarillo, tiempo: 30))
                            .padding(.vertical, distancia)
    
                        LevelView(levelModel: LevelModel(id: 4, level: .maestro, color: .green, tiempo: 60))
                            .padding(.vertical, distancia)
                         */
                    }
                }
//                .navigationViewStyle(StackNavigationViewStyle())
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal, 30.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
