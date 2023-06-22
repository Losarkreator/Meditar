//  PreviousInstructionsView.swift
//  meditar
//  Created by Losark on 20/6/23.

import SwiftUI

struct PreviousInstructionsView: View {
    @State private var currentPage = 0
    
    var body: some View {
        ZStack {
            Color.naranja.edgesIgnoringSafeArea(.vertical)
            //LinearGradient(gradient: Gradient(colors: [.negro.opacity(0.4), .amarillo]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack {
                TabView(selection: $currentPage) {
                    PreviousInstructionsSubView(title: "aPeacefulPlaceTitle_string", text: "aPeacefulPlaceDescription_string")
                        .tag(0)
                    
                    PreviousInstructionsSubView(title: "correctPostureTitle_string", text: "correctPostureDescription_string")
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
            
        }
    }
}

//MARK: - Views
struct PreviousInstructionsSubView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            Text(NSLocalizedString(title, comment: ""))
                .font(.largeTitle)
                .lineLimit(1)
                .minimumScaleFactor(0.2)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 3)
            
            Spacer(minLength: 40.0)
            
                Text(NSLocalizedString(text, comment: ""))
                    .font(.system(size: 30))
                    .minimumScaleFactor(0.5)
                    .fontWeight(.heavy)
                    .foregroundColor(.blanco)
//                            .background(.red)
            
            Spacer()
            
            //TODO: Add image
            
        }
        .padding(.horizontal, 30.0)
        .padding(.bottom, 40.0)
        //                    .background(.red.opacity(0.5))
    }
}

struct PreviousInstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousInstructionsView()
    }
}
