//
//  exerciselibraryApp.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/4/24.
//

import SwiftUI
import SwiftData

@main
struct ExerciseLibraryApp: App {
    
    @AppStorage("Onboarding") var needsOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [Workouts.self, ExerciseLocal.self])
            //Will present modal of onboardingView if needsOnboarding is true.
                .fullScreenCover(isPresented: $needsOnboarding) {
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                }
        }
    }
}
