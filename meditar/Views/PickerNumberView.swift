//  PickerNumberView.swift
//  meditar
//  Created by Losark on 4/6/23.

import SwiftUI

struct PickerNumberView: View {
    @State private var selectedNumber = 1
    @State private var displayedNumber = 150
    var customBackgroundColor: Color
    let numberOptions = 1...300
    
    var body: some View {
        VStack { //Fondo
            VStack {
                Spacer()
                
                //MARK: - Titulo
                Text("¿Cuantos minutos?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blanco)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3)

                Spacer()
                
                //MARK: - Picker
                Picker("Número", selection: $selectedNumber) {
                    ForEach(numberOptions, id: \.self) { number in
                        Text("\(number)")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(.blanco)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Spacer()
                
                //MARK: - NavigationLink
                Group {
                    ZStack {
                        CustomNavigationButton(destination: CountdownView(dataModel: LevelModel(nivel: "Personalizado", color: .azulIndigo, tiempo: selectedNumber)))
                        Text("Siguiente")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(customBackgroundColor)
                    }
                    .padding(.vertical, 20.0)
                    .padding(32.0)
                    .navigationTitle("Seleccionar duración")
                }
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(customBackgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct PickerNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PickerNumberView(customBackgroundColor: .azulIndigo)
    }
}
