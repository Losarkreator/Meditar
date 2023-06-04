//  PickerNumberView.swift
//  meditar
//  Created by Losark on 4/6/23.

import SwiftUI

struct PickerNumberView: View {
    @State private var selectedNumber = 1
    @State private var displayedNumber = 150
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
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .colorInvert()
                
                Spacer()
                
                //MARK: - Numero
                //                    Text("\(selectedNumber)")
                //                        .font(.largeTitle)
                //                        .foregroundColor(.blanco)
                
                //MARK: - NavigationLink
                NavigationButton(selectedNumber: selectedNumber)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.azul)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NavigationButton: View {
    var selectedNumber: Int
    
    var body: some View {
        NavigationLink(destination: CountdownView(dataModel: LevelModel(nivel: "Personalizado", color: .azul, tiempo: selectedNumber))) {
            
            HStack {
                Spacer()
                Text("Siguiente")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.azul)
                Spacer()
            }
            .padding(.vertical, 20.0)
            .background(Capsule().fill(Color.blanco)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3))
            .padding(32.0)
            //TODO: Poner titulo a esta seccion sin que desaparezca el anterior de Niveles y no se vea
//            .navigationBarTitle("Seleccionar duración")
//            .navigationBarHidden(false)
        }
    }
}


struct PickerNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PickerNumberView()
    }
}
