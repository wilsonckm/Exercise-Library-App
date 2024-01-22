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
    var counter: Int
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color("Seashell")
            Rectangle()
                .frame(width: 1)
                .padding(.leading, -150)
                .foregroundColor(.black)
                .opacity(0.8)
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: -20.0) {
                        Text("0\(String(counter))")
//                            .font(.onboardNumber)
                            .font(.testFontNumber)
//                            .font(.custom("CharkraPetch-Regular", size: 10))
                        Text(headline)
//                            .font(.onboardTitle)
                            .font(.testFontTitle)
                        Spacer()
                        Text(subtitle)
//                            .font(.onboardList)
                            .font(.testFontTitle)
                    }
                    Spacer()
                }
                .padding(.leading, 55.0)
                .padding(.top, 50.0)
                .padding(.bottom, 25)
                
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .padding(.horizontal, 10.0)
                            .foregroundColor(.clear)
                            .frame(height: 50)
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                            .font(Font.custom("ChakraPetch-Regular", size: 25))
                    }
                }
                .padding(.bottom, 118)
            }
        }
        .ignoresSafeArea()
    }
}


#Preview {
    OnboardingDetailViewTest(headline: "Track", subtitle: "Fitness Tracking, Made Simple", counter: 1) {
        //No action for preview
    }
}
