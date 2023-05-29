//  CountdownView.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

struct CountdownView: View {
    @StateObject private var viewModel: CountdownViewModel
    @State private var savedInitialValue: Int
    @State private var isCountdownRunning = false


    init(startingNumber: Int) {
        _viewModel = StateObject(wrappedValue: CountdownViewModel(startingNumber: startingNumber))
        _savedInitialValue = State(initialValue: startingNumber)
    }

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .stroke(lineWidth: 40)
                    .opacity(0.3)
                    .foregroundColor(.blue)
                    .frame(width: 200.0, height: 200.0)
                
                //MARK: - ANIMACION
                Circle()
                    .trim(from: 0, to: CGFloat(viewModel.currentNumber) / CGFloat(savedInitialValue))
                        .stroke(Color.azul, lineWidth: 40)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 200, height: 200)
                        .animation(.easeInOut)
                
                Text("\(viewModel.currentNumber)")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            //MARK: - BOTON
            Button(action: {
                if isCountdownRunning {
                    viewModel.resetCountdown()
                } else {
                viewModel.startCountdown()
                }
                
                isCountdownRunning.toggle()
            }) {
                Text(isCountdownRunning ? "Reiniciar" : "Empezar")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(startingNumber: 10)
    }
}
