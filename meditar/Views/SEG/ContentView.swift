//  ContentView.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

struct ContentView: View {
    @State private var currentPage = 0
    
    var body: some View {
        VStack (spacing: 30){
            Text("hellow_string")
                .font(.largeTitle).bold()
            Text("description_string")
                .font(.title2)
            Text("introduction_string \("Olvido")")
                .font(.body)
        }
        .foregroundColor(.blanco)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.locale, Locale.init(identifier: "es"))
        }
    }
}
