//  CountdownView.swift
//  meditar
//  Created by Losark on 27/5/23.


import SwiftUI

struct CountdownView: View {
    @StateObject private var viewModel: CountdownViewModel

    init(startingNumber: Int) {
        _viewModel = StateObject(wrappedValue: CountdownViewModel(startingNumber: startingNumber))
    }

    var body: some View {
        VStack {
            Text("Countdown: \(viewModel.currentNumber)")
                .font(.largeTitle)
                .padding()

            Button(action: {
                viewModel.startCountdown()
            }) {
                Text("Start Countdown")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(startingNumber: 10)
    }
}
