//
//  VistaPrincipal.swift
//  meditar
//
//  Created by Losark on 31/5/23.
//

import SwiftUI

struct VistaPrincipal: View {
    @ObservedObject var viewModel: ModeloVista
    
    var body: some View {
        VStack {
            Text("Nivel: \(viewModel.principiante.nivel)")
        }
    }
}

struct VistaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal(viewModel: ModeloVista())
    }
}
