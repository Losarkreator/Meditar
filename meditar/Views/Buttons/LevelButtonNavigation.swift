//  OtraVista.swift
//  meditar
//  Created by Losark on 31/5/23.

import SwiftUI

struct LevelButtonNavigation: View {
    var dataModel: LevelModel
    var destination: CountdownView
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Circle()
                    .fill(dataModel.color)
                    .padding(.trailing)
                    .frame(width: 40, height: 40)
                
                Text("\(dataModel.nivel): ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.negro)
                
                Spacer()
                
                Text("\(dataModel.tiempo)'")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.negro)
                    .padding(.trailing, 20.0)
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 12.0)
            .background(Capsule().fill(Color.blanco).shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5))
        }
    }
}

struct BotonNavigation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let modeloVista = ViewModel()
            LevelButtonNavigation(dataModel: modeloVista.intermedio, destination: CountdownView(dataModel: modeloVista.intermedio))
        }
    }
}
