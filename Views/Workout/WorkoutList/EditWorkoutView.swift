//
//  WorkoutUpdateView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/22/24.
//

import SwiftUI
import SwiftData

struct EditWorkoutView: View {
    
    @Environment(\.modelContext) var modelContext
    @Binding var path: NavigationPath
    @Bindable var workout: Workout
    var isNewWorkout: Bool
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $workout.name)
                TextField("Type", text: $workout.workoutType)
                TextField("Intensity", text: $workout.intensityLevel)
                TextField("Notes", text: $workout.notes, axis: .vertical)
            }
        }
        .navigationTitle("Edit Workout")
        .navigationBarTitleDisplayMode(.inline)
        
        Button("Save Workout") {
            addWorkout()
        }
    }
    
    func addWorkout() {
        modelContext.insert(workout)
        path.removeLast()
    }
}

//#Preview {
//    EditWorkoutView()
//}
