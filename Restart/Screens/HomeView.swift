//
//  HomeView.swift
//  Restart
//
//  Created by Prithviraj Patil on 10/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            // MARK: Header
            
            Spacer()
            ZStack {
                Spacer()
                CircleGroupView(shapeColor: .red, shapeOpacity: 0.5)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 60 : -60)
//                .offset(x: isAnimating ? 40 : -60)
//                .offset(x: isAnimating ? 60 : -60)
                .animation(Animation
                    .easeOut(duration: 4)
                    .repeatForever()
                , value: isAnimating)
            }
            
            // MARK: Center
            
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: Footer
            Spacer()
            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                }
                isOnboardingViewActive = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
