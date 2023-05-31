import SwiftUI
import AudioToolbox

struct ProbarSonidos: View {
    @StateObject private var viewModel: CountdownViewModel
    @State private var savedInitialValue: Int
    @State private var isCountdownRunning = false
    @State private var numeroSonido: Int = 1132
    // Rewind 1103 1118 1129
    
    init(startingNumber: Int) {
        _viewModel = StateObject(wrappedValue: CountdownViewModel(startingNumber: startingNumber))
        _savedInitialValue = State(initialValue: startingNumber)
    }
    
    var body: some View {
        VStack {
            VStack { //Margenes
                Spacer()
                //MARK: - Contador Numeros
                Text("\(viewModel.currentNumber)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(40.0)
                    .foregroundColor(.blanco)
                
                //MARK: - CuentAtras Circulo
                ZStack {
                    Circle()
                        .stroke(lineWidth: 40)
                        .opacity(0.05)
                        .foregroundColor(.negro)
                        .frame(width: 300.0, height: 300.0)
                    Circle()
                        .trim(from: 0, to: CGFloat(viewModel.currentNumber) / CGFloat(savedInitialValue))
                        .stroke(Color.blanco, lineWidth: 40)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 300, height: 300)
                        .animation(.easeInOut)
                    
                }
                Spacer()
                Text(String("Sonido: \(numeroSonido)"))
                    .font(.title)
                    .foregroundColor(.blanco)
                Spacer()
                
                //MARK: - BOTON
                Button(action: {
                    if isCountdownRunning {
                        viewModel.resetCountdown()
                        viewModel.playSystemSound(soundID: SystemSoundID(numeroSonido))
                        numeroSonido += 1
                    } else {
                        viewModel.startCountdown()
                        viewModel.playSystemSound(soundID: SystemSoundID(numeroSonido))
                    }
                    isCountdownRunning.toggle()
                }) {
                    Image(systemName: isCountdownRunning ? "stop.circle" : "play.circle")
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                        .foregroundColor(.blanco)
                }
            }
            .padding(.horizontal, 20.0)
            .padding(.bottom, 40.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.amarillo)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProbarSonidos_Previews: PreviewProvider {
    static var previews: some View {
        ProbarSonidos(startingNumber: 2)
    }
}
