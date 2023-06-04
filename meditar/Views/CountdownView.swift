//  VistaDestino.swift
//  meditar
//  Created by Losark on 31/5/23.

import SwiftUI

struct CountdownView: View {
    var dataModel: LevelModel
    @StateObject private var viewModel = ViewModel()
    @State private var isCountdownRunning = false
    @State private var currentNumber = 0
    @State private var startingTime = 0
    @State private var timer: Timer?
    @State private var desenfoque = false
    
    var body: some View {
        VStack { //Fondo
            VStack { //Margenes
                Spacer()
                //MARK: - Titulo
                Text("Nivel: \(dataModel.nivel)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.blanco)
                //MARK: - Contador Numeros
                Text("\(formatTime(seconds: currentNumber))")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.bottom, 40.0)
                    .foregroundColor(.blanco)
                
                //MARK: - CuentAtras Circulo
                ZStack {
                    Circle()
                        .stroke(lineWidth: 40)
                        .opacity(0.05)
                        .foregroundColor(.negro)
                        .frame(width: 300.0, height: 300.0)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(currentNumber) / CGFloat(startingTime))
                        .stroke(Color.blanco, lineWidth: 40)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 300, height: 300)
                        .animation(.linear(duration: isCountdownRunning ? 1.0 : 0.2))

                    Image("MeditIcon")
                        .aspectRatio(contentMode: .fit)
                        .blur(radius: desenfoque ? 5 : 0)
                }
                
                Spacer()
                
                //MARK: - BOTON
                Button(action: {
                    if !isCountdownRunning {
                        startCountdown(with: currentNumber)
                        viewModel.playSystemSound()
                        viewModel.playVibration()
                    } else {
                        resetCountdown()
                        viewModel.playSystemSound(soundID: 1132)
                        viewModel.playVibration()
                    }
                    isCountdownRunning.toggle()
                    
                }) {
                    Image(systemName: isCountdownRunning ? "stop.circle" : "play.circle")
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                        .foregroundColor(.blanco)
                }
                
            } //Margenes
            .padding(.horizontal, 20.0)
            .padding(.bottom, 40.0)
        } //Fondo
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(dataModel.color)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            startingTime = dataModel.tiempo //* 60
            currentNumber = startingTime
        }
    }
    
    //MARK: - Funciones
    func startCountdown(with minutos: Int) {
        resetCountdown()
        currentNumber = minutos
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            currentNumber -= 1
            
            //TODO: hacer que se desenfoque cada X segundos
            withAnimation {
                self.desenfoque.toggle()
            }
            
            // Llega a 0
            if currentNumber == 0 {
                timer?.invalidate()
                viewModel.playSystemSound(soundID: 1030)
            }
        }
    }
    
    func resetCountdown() {
        currentNumber = startingTime
        timer?.invalidate()
    }
    
    func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%d:%02d", minutes, remainingSeconds)
    }
    
}

struct VistaDestino_Previews: PreviewProvider {
    static var previews: some View {
        let modeloVista = ViewModel()
        CountdownView(dataModel: modeloVista.principiante)
    }
}
