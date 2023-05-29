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
            VStack { //Margenes
                Spacer()
                
                //Contador Numeros
                Text("\(viewModel.currentNumber)' 23''")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(40.0)
                    .foregroundColor(.blanco)
                
                ZStack { // CuentAtras Circulo
                    Circle()
                        .stroke(lineWidth: 40)
                        .opacity(0.05)
                        .foregroundColor(.negro)
                        .frame(width: 300.0, height: 300.0)
                    Circle()
                        .trim(from: 0, to: CGFloat(viewModel.currentNumber) / CGFloat(savedInitialValue))
                        .stroke(Color.blanco, lineWidth: 40)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 300, height: 300)
                        .animation(.easeInOut)
                    
                    Image("MeditIcon")
                        .aspectRatio(contentMode: .fit)
                    
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
                    //"pause.circle"
                    Image(systemName: isCountdownRunning ? "stop.circle" : "play.circle")

                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                        .foregroundColor(.blanco)
                }
            }
            .padding(.horizontal, 20.0)
            .padding(.bottom, 40.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.amarillo)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(startingNumber: 10)
    }
}
