//
//  exerciselibraryApp.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/4/24.
//

import SwiftUI

@main
struct ExerciseLibraryApp: App {
    
    @AppStorage("Onboarding") var isOnboardingCompleted: Bool = false
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .fullScreenCover(isPresented: $isOnboardingCompleted) {
                    isOnboardingCompleted = false
                } content: {
                    OnboardingView()
                }
                
        }
    }
}
