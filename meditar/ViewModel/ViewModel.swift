//  ModeloVista.swift
//  meditar
//  Created by Losark on 31/5/23.

import SwiftUI
import CoreHaptics
import AudioToolbox //Sonidos del sistema
//import AVFoundation //Para añadir un sonido

class ViewModel: ObservableObject {
    @Published var principiante: LevelModel
    @Published var intermedio: LevelModel
    @Published var experto: LevelModel
    @Published var maestro: LevelModel
    @Published var lama: LevelModel
    var engine: CHHapticEngine?
    
    @Published var currentNumber: Int = 0
    @State private var timer: Timer?
    
    init() {
        principiante = LevelModel(nivel: NSLocalizedString("beginner_string", comment: ""), color: Color.rojo, tiempo: 5)
        intermedio = LevelModel(nivel: NSLocalizedString("intermediate_string", comment: ""), color: Color.naranja, tiempo: 15)
        experto = LevelModel(nivel: NSLocalizedString("expert_string", comment: ""), color: Color.amarillo, tiempo: 30)
        maestro = LevelModel(nivel: NSLocalizedString("master_string", comment: ""), color: Color.verde, tiempo: 60)
        lama = LevelModel(nivel: NSLocalizedString("lama_string", comment: ""), color: Color.azul, tiempo: 120)
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error starting haptic engine: \(error)")
            //Si falla puede ser debido a una version de iphone inferior al 8
        }
        
    }
    
    //MARK: - Funciones
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
