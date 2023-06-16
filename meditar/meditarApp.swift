//  meditarApp.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

@main
struct meditarApp: App {
    
    init() {
        UIApplication.shared.isIdleTimerDisabled = true // Desactiva el modo de suspensión automático
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
