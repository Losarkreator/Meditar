//  NavigationButtonExample.swift
//  meditar
//  Created by Losark on 29/5/23.

import SwiftUI

struct CustomNavigationButton<Destination: View>: View {
    var destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            Capsule().fill(Color.blanco).shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                .frame(height: 69)
        }
    }
}

struct CustomNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationButton(destination: LevelsView())
    }
}
