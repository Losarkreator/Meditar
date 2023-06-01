//  VistaDestino.swift
//  meditar
//  Created by Losark on 31/5/23.

import SwiftUI

struct VistaDestino: View {
    var modeloDeDatos: ModeloDatos
    @StateObject private var viewModel = ModeloVista()
    @State private var isCountdownRunning = false
    //@State private var savedInitialValue: Int
    
    var body: some View {
        VStack { //Fondo
            VStack { //Margenes
                Spacer()
                
                //MARK: - Titulo
                Text("Nivel: \(modeloDeDatos.nivel)") //\()
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.blanco)
                //MARK: - Contador Numeros
                Text("\(modeloDeDatos.tiempo)' 00''")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.bottom, 40.0)
                    .foregroundColor(.blanco)
                //Spacer()
                
                //MARK: - CuentAtras Circulo
                ZStack {
                    Circle()
                        .stroke(lineWidth: 40)
                        .opacity(0.05)
                        .foregroundColor(.negro)
                        .frame(width: 300.0, height: 300.0)
                    Circle()
                        .trim(from: 0, to: CGFloat(modeloDeDatos.tiempo) / CGFloat(5)) //CAMBIAR 5 por Starting number
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
                    if !isCountdownRunning {
                        //viewModel.startCountdown()
                        viewModel.playSystemSound()
                        viewModel.playVibration()
                    } else {
                        //viewModel.resetCountdown()
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
        .background(modeloDeDatos.color)
        .edgesIgnoringSafeArea(.all)
    }
}

struct VistaDestino_Previews: PreviewProvider {
    static var previews: some View {
        let modeloVista = ModeloVista()
        VistaDestino(modeloDeDatos: modeloVista.principiante)
    }
}
