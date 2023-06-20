//  CustomLevelView.swift
//  meditar
//  Created by Losark on 4/6/23.

import SwiftUI

struct CustomLevelView<Destination: View>: View {
    var dataModel: LevelModel
    var destination: Destination
    
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                    Circle()
                        .fill(dataModel.color)
                        .padding(.trailing)
                        .frame(width: 40, height: 40)
                
                Text("Selecciona duración")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.negro)
                
                Spacer()
                
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 12.0)
            .background(Capsule().fill(Color.blanco).shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5))
        }
        
    }
}

struct CustomLevelView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        CustomLevelView(dataModel: LevelModel(nivel: "Custom", color: .azul, tiempo: 1), destination: PickerNumberView())
    }
}
