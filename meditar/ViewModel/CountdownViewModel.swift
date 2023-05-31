//  CountdownViewModel.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI
import CoreHaptics
import AudioToolbox // Sonidos del sistema
//import AVFoundation //Para añadir un sonido

class CountdownViewModel: ObservableObject {
    @Published var currentNumber: Int
    var timer: Timer?
    var engine: CHHapticEngine?
    
    private let startingNumber: Int
    
    init(startingNumber: Int) {
        self.startingNumber = startingNumber
        currentNumber = startingNumber
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
    
    func startCountdown() {
        guard currentNumber > 0 else {
            return
        }
        
        //TODO: Pasar a minutos con segundos
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else {
                return
            }
            self.currentNumber -= 1
            if self.currentNumber == 0 {
                self.timer?.invalidate()
                self.timer = nil
                playSystemSound(soundID: 1030)
            }
        }
    }
    
    func resetCountdown() {
        timer?.invalidate()
        timer = nil
        currentNumber = startingNumber
    }
    
    func playSystemSound(soundID: SystemSoundID = 1104) {
        AudioServicesPlaySystemSound(soundID)
    }
    
}
