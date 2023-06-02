//  Temporizador.swift
//  meditar
//  Created by Losark on 2/6/23.

import SwiftUI

struct Temporizador: View {
    @State private var timer: Timer?
    @State private var currentNumber = 0
    @State private var startingTime = 0
    var modeloDeDatos: ModeloDatos
    
    var body: some View {
        VStack{
            Text("Tiempo: \(formatTime(seconds: currentNumber))")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(.black.opacity(0.75))
                .clipShape(Capsule())
            
            Button("Start Countdown") {
                startCountdown(with: currentNumber)
            }
            .padding()
            
            Button("Reset Countdown") {
                resetCountdown()
            }
            .padding()
        }
        .onAppear {
            startingTime = modeloDeDatos.tiempo * 60
            currentNumber = startingTime
        }
        
    }
    
    //MARK: - Funciones
    func startCountdown(with minutos: Int) {
        resetCountdown()
        currentNumber = minutos
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            currentNumber -= 1
            // Llega a 0
            if currentNumber == 0 {
                timer?.invalidate()
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

struct Temporizador_Previews: PreviewProvider {
    static var previews: some View {
        let modeloVista = ModeloVista()
        Temporizador(modeloDeDatos: modeloVista.principiante)
    }
}
