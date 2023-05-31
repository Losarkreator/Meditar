//  VistaPrincipal.swift
//  meditar
//  Created by Losark on 31/5/23.

import SwiftUI

struct VistaPrincipal: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.vistas, id: \.nivel) { vista in
                CapsulaView(vista: vista)
            }
        }
    }
}

struct VistaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
    }
}
