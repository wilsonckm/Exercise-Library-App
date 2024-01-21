//
//  OnboardingDetailViewTest.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import SwiftUI

struct OnboardingDetailViewTest: View {
    
    var headline: String
    var subtitle: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color("Seashell")
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 1)
                    .padding(.leading, -150)
            }
            VStack (spacing: 0) {
                
                Spacer()
                Spacer()
                Text(headline)
                    .bold()
                    .font(.system(size: 22))
                Text(subtitle)
                    .padding(.bottom, 64)
                    .padding(.horizontal, 16)
                
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
                .padding(.bottom, 118)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingDetailViewTest(headline: "Welcome to Exercise Library", subtitle: "Track your exercises and search up new one!") {
        //No action for preview
    }
}
