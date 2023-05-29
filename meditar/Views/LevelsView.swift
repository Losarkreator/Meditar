//  LevelsView.swift
//  meditar
//  Created by Losark on 29/5/23.

import SwiftUI

struct LevelsView: View {
    private func appDescription() -> String {
        let mensaje = """
    ¡Bienvenido a nuestra aplicación de meditación personalizada!
    
    Con nuestra intuitiva y elegante interfaz, podrás cronometrar tus sesiones de meditación de manera efectiva y adaptada a tu nivel de práctica. Ya seas principiante, intermedio o experto, nuestra aplicación te proporcionará los tiempos adecuados para cada nivel, guiándote hacia una experiencia de meditación más profunda y satisfactoria.
    
    Con solo unos simples toques, podrás seleccionar tu nivel de práctica y comenzar tu sesión de meditación. Nuestra aplicación te ofrecerá el tiempo recomendado para cada nivel, permitiéndote sumergirte en un estado de tranquilidad y enfoque.
    
    Además, nuestra aplicación también te brinda la flexibilidad de personalizar la duración de tus sesiones de meditación, para adaptarse a tus necesidades y preferencias individuales. Ya sea que desees meditar durante unos minutos o sumergirte en una sesión más prolongada, estamos aquí para acompañarte en tu viaje de meditación.
    
    ¡Permite que nuestra app te guíe hacia un mayor bienestar y paz interior en tu vida diaria!
    """
        return mensaje
    }
    @State private var isDescriptionVisible = false
    
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
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    //MARK: - Lista de niveles
                    VStack {
                        LevelViewNavigationButton(levelModel: LevelModel(id: 1, level: .principiante, color: Color.rojo, tiempo: 5), destination: CountdownView(startingNumber: 5))
                        
                        LevelViewNavigationButton(levelModel: LevelModel(id: 2, level: .intermedio, color: Color.orange, tiempo: 15), destination: CountdownView(startingNumber: 15))
                        
                        LevelViewNavigationButton(levelModel: LevelModel(id: 3, level: .experto, color: Color.amarillo, tiempo: 30), destination: CountdownView(startingNumber: 30))
                        
                        LevelViewNavigationButton(levelModel: LevelModel(id: 4, level: .maestro, color: Color.green, tiempo: 60), destination: CountdownView(startingNumber: 60))
                        
                        LevelViewNavigationButton(levelModel: LevelModel(id: 5, level: .lama, color: Color.azul, tiempo: 0), destination: CountdownView(startingNumber: 0))
                    }
                    
                    Spacer()
                    
                    //MARK: - Desplegar descripcion
                    if !isDescriptionVisible {
                        HStack() {
                            Spacer()
                            Button(action: {
                                isDescriptionVisible = true
                            }) {
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.morado)
                                    .frame(width: 60, height: 60)
                                    .background(
                                        Circle().foregroundColor(.blanco.opacity(0.7))
                                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                                    )
                                
                            }
                            Spacer()
                        }
                        //MARK: - Descripción
                    } else {
                        ScrollView {
                            Text(appDescription())
                                .font(.body)
                                .foregroundColor(Color.white)
                                .padding(.leading)
                                .padding(.top)
                           
                            Button(action: {
                                isDescriptionVisible = false
                                //TODO: hacer que se cierre cuando tocas en otro sitio
                            }) {
                                Image(systemName: "chevron.up")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black.opacity(0.2))
                                    .frame(width: 40, height: 60)
                                    .background(Circle().foregroundColor(.morado))
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.black.opacity(0.2)))
                        .clipped() //Evita que el texto se desborde
                        .padding(.top, 20.0)
                    }
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.horizontal, 30.0/*@END_MENU_TOKEN@*/)
            }
            .navigationBarTitle("Niveles")
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
