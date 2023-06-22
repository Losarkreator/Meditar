//  LevelsView.swift
//  meditar
//  Created by Losark on 29/5/23.

import SwiftUI

struct LevelsView: View {
    let viewModel = ViewModel()
    private func appDescription() -> String {
        let mensaje = """
    ¡Bienvenido a nuestra aplicación de meditación personalizada!
    
    Con nuestra intuitiva y elegante interfaz, podrás cronometrar tus sesiones de meditación de manera efectiva y adaptada a tu nivel de práctica. Ya seas principiante, intermedio o experto, nuestra aplicación te proporcionará los tiempos adecuados para cada nivel, guiándote hacia una experiencia de meditación más profunda y satisfactoria.
    
    ¡Permite que nuestra app te guíe hacia un mayor bienestar y paz interior en tu vida diaria!
    """
        return mensaje
    }
    @State private var isDescriptionVisible = false
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white] // Modifica el estilo de apariencia de navegación para cambiar el color del título
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - Color del fondo
                Color.morado.edgesIgnoringSafeArea(.all)
                LinearGradient(gradient: Gradient(colors: [.morado, .negro.opacity(0.2)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    //MARK: - Titulo
                    Text(NSLocalizedString("levels_string", comment: ""))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 70.0)
                        .padding(.bottom, 60.0)
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3)
                    
                    //MARK: - Lista de niveles
                    VStack {
                        LevelButtonNavigation(dataModel: viewModel.principiante, destination: CountdownView(dataModel: viewModel.principiante))
                        
                        LevelButtonNavigation(dataModel: viewModel.intermedio, destination: CountdownView(dataModel: viewModel.intermedio))
                        
                        LevelButtonNavigation(dataModel: viewModel.experto, destination: CountdownView(dataModel: viewModel.experto))
                        
                        LevelButtonNavigation(dataModel: viewModel.maestro, destination: CountdownView(dataModel: viewModel.maestro))
                        
                        LevelButtonNavigation(dataModel: viewModel.lama, destination: CountdownView(dataModel: viewModel.lama))
                        
                        //MARK: - Custom
                        CustomLevelView(dataModel: LevelModel(nivel: "Custom", color: .azulIndigo, tiempo: 60), destination: PickerNumberView(customBackgroundColor: .azulIndigo))
                    }
                    
                    Spacer()
                    
                    //MARK: - Instrucciones
                    ZStack {
                        CustomNavigationButton(destination: InstructionsView())
                        Text(NSLocalizedString("instructions_string", comment: ""))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.morado)
                    }
                }
                .padding(.horizontal, 30.0)
            }
            .navigationBarTitle(NSLocalizedString("levels_string", comment: ""), displayMode: .inline)
            .navigationBarHidden(true)
        }
        .accentColor(.blanco)
    }
}

struct NivelesTest_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
