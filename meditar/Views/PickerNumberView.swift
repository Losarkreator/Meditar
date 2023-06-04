//
//  PickerNumberView.swift
//  meditar
//
//  Created by Losark on 4/6/23.
//

import SwiftUI

struct PickerNumberView: View {
    @State private var selectedNumber = 1
    @State private var displayedNumber = 1
    let numberOptions = 1...100
    
    var body: some View {
        VStack {
            Text("¿Cuantos minutos vas a meditar?")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text("\(displayedNumber)")
                .font(.largeTitle)
            
            Picker("Número", selection: $selectedNumber) {
                ForEach(numberOptions, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 150)
            .padding()
            
            Button(action: {
                displayedNumber = selectedNumber
            }) {
                Text("Aceptar")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
        
        
        
    }
}

struct PickerNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PickerNumberView()
    }
}
