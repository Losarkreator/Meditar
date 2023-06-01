//  ModeloVista.swift
//  meditar
//  Created by Losark on 31/5/23.

import SwiftUI
import CoreHaptics
import AudioToolbox //Sonidos del sistema
//import AVFoundation //Para añadir un sonido

class ModeloVista: ObservableObject {
    @Published var principiante: ModeloDatos
    @Published var intermedio: ModeloDatos
    var engine: CHHapticEngine?
    
    init() {
        principiante = ModeloDatos(nivel: "Principiante", color: Color.rojo, tiempo: 5)
        intermedio = ModeloDatos(nivel: "Intermedio", color: Color.orange, tiempo: 10)
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error starting haptic engine: \(error)")
            //Si falla puede ser debido a una version de iphone inferior al 8
        }
    }
    
    
    func playVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        do {
            let pattern = try CHHapticPattern(events: [
                CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 0.0)
            ], parameters: [])

            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Error playing haptic feedback: \(error)")
        }
    }

    func playSystemSound(soundID: SystemSoundID = 1104) {
        AudioServicesPlaySystemSound(soundID)
    }
    
}
