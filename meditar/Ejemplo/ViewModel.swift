//
//  ViewModel.swift
//  meditar
//
//  Created by Losark on 31/5/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var vistas: [VistaDatos] = []
    
    init() {
        let otraVista = OtraVista(nivel: "", color: .clear, tiempo: 0)
        
        vistas = [
            VistaDatos(nivel: "Nivel 1", color: .red, tiempo: 10, destino: AnyView(otraVista)),
            VistaDatos(nivel: "Nivel 2", color: .blue, tiempo: 15, destino: AnyView(otraVista)),
            VistaDatos(nivel: "Nivel 3", color: .green, tiempo: 20, destino: AnyView(otraVista))
        ]
    }
}

