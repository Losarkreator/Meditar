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
                    Text("Niveles ")
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
                        CustomNavigationButton(destination: Instructions())
                        Text("Instrucciones")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.morado)
                    }
                    
                    
                    /*
                     //MARK: - Desplegar descripcion
                     Group {
                        if !isDescriptionVisible {
                        HStack() {
                            Spacer()
                            Button(action: {
                                isDescriptionVisible = true
                            }) {
                                Image(systemName: "chevron.up")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.blanco)
                                    .frame(width: 60, height: 60)
                                    .background(
                                        Circle().foregroundColor(.morado)
                                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                                    )
                                
                            }
                            Spacer()
                        }
                        //MARK: - Descripción
                    } else {
                        VStack {
                            ScrollView {
                                Text(appDescription())
                                    .font(.body)
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal)
                                    .padding(.top)
                                
                                Button(action: {
                                    isDescriptionVisible = false
                                    //TODO: hacer que se cierre cuando tocas en otro sitio
                                }) {
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.morado)
                                        .frame(width: 40, height: 60)
                                        .background(Circle().foregroundColor(.blanco))
                                }
                            }
                            .clipped() //Evita que el texto se desborde
                            //                            .padding(4.0)
                        }
                        .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.black.opacity(0.2)))
                        .padding(.top, 20.0)
                    }
                    }
                     */
                }
                .padding(.horizontal, 30.0)
            }
            .navigationBarTitle(Text("Niveles"), displayMode: .inline)
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
