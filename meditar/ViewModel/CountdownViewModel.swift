//  CountdownViewModel.swift
//  meditar
//  Created by Losark on 27/5/23.

import SwiftUI

class CountdownViewModel: ObservableObject {
    @Published var currentNumber: Int
    var timer: Timer?

    init(startingNumber: Int) {
        currentNumber = startingNumber
    }

    func startCountdown() {
        guard currentNumber > 0 else {
            return
        }

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else {
                return
            }

            self.currentNumber -= 1

            if self.currentNumber == 0 {
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }
}
