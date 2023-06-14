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
    @State private var timerBlur: Timer?
    @State private var desenfoque = false
    @State private var duracionDesenfoque: Double = 5.0
    @State private var showAlert = false
    
    var body: some View {
        ZStack { //Fondo
            dataModel.color
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack { //Margenes
                //MARK: - Cabecera
                VStack {
                    Text("\(dataModel.nivel)")
                    Text("\(formatTime(seconds: currentNumber))")
                }
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.blanco)
                .padding(.bottom, 40.0)
                
                // Circulos //Boton
                ZStack {
                    //MARK: - Circulos
                    Group {
                        Circle()
                            .stroke(lineWidth: 40)
                            .opacity(0.05)
                            .foregroundColor(.negro)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(currentNumber) / CGFloat(startingTime))
                            .stroke(Color.blanco, style: StrokeStyle(lineWidth: 40,lineCap: .round))
                            .rotationEffect(.degrees(-90))
                            .animation(.linear(duration: isCountdownRunning ? 1.0 : 0.2))
                    }
                    
                    //MARK: - Boton
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
                        Image(systemName: isCountdownRunning ? "stop.fill" : "play.fill")
                            .foregroundColor(.blanco)
                            .font(.system(size: UIScreen.main.bounds.size.width / 3))
                    }
                }
                .padding(.horizontal, 50.0)
                
                Spacer()
                
                //MARK: - Imagen
                Group {
                    Image("MeditIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .blur(radius: desenfoque ? 5 : 0)
                    .animation(Animation.easeInOut(duration: isCountdownRunning ? duracionDesenfoque : 0))
                }
                .frame(height: UIScreen.main.bounds.size.width / 1.8)
//                .background(Color.morado)
                
            } //Margenes
//            .background(.black.opacity(0.2))
            .padding(.horizontal, 20.0)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("¡Enhorabuena!"),
                      message: Text("Has completado la meditación"),
                      dismissButton: .default(Text("Aceptar")))
            }
        } //Fondo
        //MARK: - Cuando Aparece
        .onAppear {
            startingTime = dataModel.tiempo * 60
            currentNumber = startingTime
        }
    }
    
    //MARK: - Funciones
    func startCountdown(with minutos: Int) {
        resetCountdown()
        animateBlur()
        currentNumber = minutos
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            currentNumber -= 1
            
            // Llega a 0
            if currentNumber == 0 {
                self.desenfoque = false
                timer?.invalidate()
                timerBlur?.invalidate()
                viewModel.playSystemSound(soundID: 1030)
                showAlert = true
            }
        }
    }
    
    func animateBlur() {
        self.desenfoque.toggle()
        timerBlur = Timer.scheduledTimer(withTimeInterval: duracionDesenfoque, repeats: true) { _ in
            self.desenfoque.toggle()
        }
    }
    
    func resetCountdown() {
        currentNumber = startingTime
        timer?.invalidate()
        timerBlur?.invalidate()
        self.desenfoque = false
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
