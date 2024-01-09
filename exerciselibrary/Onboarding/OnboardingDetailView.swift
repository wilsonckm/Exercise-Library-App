//
//  OnboardingDetailView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/8/24.
//

import SwiftUI

struct OnboardingDetailView: View {
    
    var bgColor: Color
    var headline: String
    var subtitle: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack {
                Image("onboarding")
                Text(headline)
                    .bold()
                    .font(.system(size: 22))
                    .foregroundStyle(.white)
                Text(subtitle)
                    .foregroundStyle(.white)
                Spacer()
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .padding(.horizontal, 10.0)
                            .foregroundColor(.white)
                            .frame(height: 50)
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingDetailView(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to Exercise Library", subtitle: "Track your exercises and search up new one!") {
        //No action for preview
    }
}
