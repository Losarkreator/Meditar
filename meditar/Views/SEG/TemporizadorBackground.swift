//  TemporizadorBackground.swift
//  meditar
//  Created by Losark on 9/6/23.

import SwiftUI

struct TemporizadorBackground: View {
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 5
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var totalTime = 5
    
    var body: some View{
        
        ZStack {
            //MARK: - Fondo
            Color.amarillo.edgesIgnoringSafeArea(.all)
            
            //MARK: - Top
            VStack {
                //MARK: - Textos
                VStack {
                    Text("Nivel")
                        .font(.system(size: 65))
                        .fontWeight(.bold)
                    Text("00:00 Count: \(count)")
                        .font(.title)
                }
                .padding(.bottom, 50.0)
                
                ZStack {
                    //MARK: - Circulos
                    Group {
                        Circle()
                            .stroke(Color.blanco.opacity(0.3), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color.blanco, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .rotationEffect(.init(degrees: -90))
                    }
                    
                    //MARK: - Boton
                    Button(action: {
                        start.toggle()
                        
                        if !start {
                            count = totalTime
                        }
                        
                        
                    }) {
                        Image(systemName: self.start ? "stop.fill" : "play.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        .padding(90.0)
                    }
                }
                .frame(width: 280, height: 280)
                
                //MARK: - Botones
                /*
                HStack(spacing: 20){
                    // Play y Pause
                    Button(action: {
                        if self.count == totalTime {
                            self.count = 0
                            withAnimation(.default){
                                self.to = 0
                            }
                        }
                        self.start.toggle()
                        
                    }) {
                        HStack(spacing: 15){
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                            Text(self.start ? "Pause" : "Play")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(radius: 6)
                    }
                    
                    // Restart
                    Button(action: {
                        self.count = 0
                        withAnimation(.default){
                            self.to = 0
                        }
                    }) {
                        HStack(spacing: 15){
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.red)
                            Text("Restart")
                                .foregroundColor(.red)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(
                            Capsule()
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .shadow(radius: 6)
                    }
                }
                .padding(.top, 55)
                 */
            }
            .foregroundColor(.blanco)
            
        }
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
        })
        .onReceive(self.time) { (_) in
            // Si ha empezado:
            if self.start {
//                currentNumber = minutos
                count = totalTime
                
                
                if self.count > 0 {
                    self.count -= 1
                    withAnimation(.default){
                        self.to = CGFloat(self.count) / CGFloat(totalTime)
                    }
                } else {
//                    self.start.toggle()
                }
                
//                if self.count != totalTime {
//                    self.count += 1
//                    print("Cuenta: \(count)")
//                    withAnimation(.default){
//                        self.to = CGFloat(self.count) / CGFloat(totalTime)
//                    }
//                } else {
//                    self.start.toggle()
//                    self.Notify()
//                }
                
                
            }
        }
        
    }
    
    func Notify(){
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer Is Completed Successfully In Background !!!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}

struct TemporizadorBackground_Previews: PreviewProvider {
    static var previews: some View {
        TemporizadorBackground()
    }
}
