//
//  OnboardingView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/8/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var onboardingIndex = 0
    
    var body: some View {
        TabView(selection: $onboardingIndex ) {
                OnboardingDetailView(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to Exercise Library", subtitle: "Track workouts and search for new exercises") {
                    withAnimation {
                        onboardingIndex = 1
                    }
                }
                .tag(1)
                .ignoresSafeArea()
            
            OnboardingDetailView(bgColor: Color(red: 255/255, green: 154/255, blue: 189/255), headline: "Chat with a personal coach", subtitle: "Get personalized care for your specific goals") {
                withAnimation {
                    onboardingIndex = 2
                }
            }
            .tag(2)
            .ignoresSafeArea()
        }
    }
}
#Preview {
    OnboardingView()
}
