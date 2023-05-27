//  ContentView.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CountdownView(startingNumber: 10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
