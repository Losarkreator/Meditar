//  LevelViewNavigationButton.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

struct LevelViewNavigationButton<Destination: View>: View {
    var levelModel: LevelModel
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Circle()
                    .fill(levelModel.color)
                    .padding(.trailing)
                    .frame(width: 40, height: 40)

                Text("\(levelModel.level.levelString): \(levelModel.tiempo) minutos")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)

                Spacer()
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 12.0)
            .background(
                Capsule()
                    .fill(Color.blanco)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            )
            
        }
    }
}

struct LevelViewNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            LevelViewNavigationButton(levelModel: LevelModel(id: 1, level: .principiante, color: Color.rojo, tiempo: 5), destination: CountdownView(startingNumber: 5))
        }
        
        
    }
}
