//
//  CustomLevelView.swift
//  meditar
//
//  Created by Losark on 4/6/23.
//

import SwiftUI

struct CustomLevelView: View {
    var dataModel: LevelModel
    var destination: AnyView
    
    
    var body: some View {
        CustomNavigationButton(destination: destination, texto: "Selecciona duración", colorCirculo: dataModel.color, textoEspecial: false)
    }
}

struct CustomLevelView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        CustomLevelView(dataModel: LevelModel(nivel: "Custom", color: .azul, tiempo: 1), destination: AnyView(PickerNumberView()))
    }
}
