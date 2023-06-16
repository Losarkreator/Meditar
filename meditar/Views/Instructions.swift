//
//  Instructions.swift
//  meditar
//
//  Created by Losark on 16/6/23.
//

import SwiftUI

struct Instructions: View {
    var body: some View {
        ZStack {
            Color.negro.edgesIgnoringSafeArea(.all)
            
            Text("WORK \nIN \nPROGRESS")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .colorInvert()
        }
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
