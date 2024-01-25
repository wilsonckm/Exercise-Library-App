//
//  AddExercise.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/22/24.
//

import SwiftUI
import SwiftData

struct CreateExercise: View {
    var exercise: ExerciseLocal
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    
    //Form
    @State private var exerciseName: String = ""
    @State private var sets: String = ""
    @State private var reps: String = ""
//    @State private var rest: TimeInterval = 0
    @State private var weight: String = ""
    @State private var notes: String = ""
    
    var body: some View {
        VStack {
            TextField("New Exercise", text: $exerciseName)
//            TextField("Body Part", text: $exerciseName)
//            TextField("Equipment", text: $exerciseName)
//            TextField("Target", text: $exerciseName)
//            TextField("Instructions", text: $exerciseName)
            TextField("Sets", text: $sets)
            TextField("Reps", text: $reps)
//            TextField("Rest", text: $rest)
            TextField("Notes", text: $notes)
        }
        .onAppear {
            exerciseName = exercise.name
            sets = exercise.sets
            reps = exercise.reps
            notes = exercise.notes
        }
        
        Button("Save") {
            createExercise()
        }
       
    }
    
    func createExercise() {
        exercise.name = exerciseName
        exercise.sets = sets
        exercise.reps = reps
        exercise.weight = weight
        exercise.notes = notes
        modelContext.insert(exercise)
        dismiss()
    }
}

//#Preview {
//    CreateExercise()
//}
