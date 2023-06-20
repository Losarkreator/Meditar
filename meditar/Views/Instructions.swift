//
//  Instructions.swift
//  meditar
//
//  Created by Losark on 20/6/23.
//

import SwiftUI

struct Instructions: View {
    var body: some View {
        ZStack {
            Color.amarillo
                .edgesIgnoringSafeArea(.vertical)
            
            
            Text("Instrucciones")
                .font(.largeTitle)
            .bold()
        }
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
