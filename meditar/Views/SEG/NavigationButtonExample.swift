//  NavigationButtonExample.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct NavigationButton<Destination: View>: View {
    var title: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

struct NavigationButtonExample: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Pantalla de inicio")
                    .font(.largeTitle)
                
                NavigationButton(title: "TEXTO nivel", destination: AnotherView())
            }
        }
    }
}

struct AnotherView: View {
    var body: some View {
        VStack {
            Text("Otra pantalla")
                .font(.largeTitle)
            
            // Contenido adicional de la pantalla
        }
    }
}


struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonExample()
    }
}
