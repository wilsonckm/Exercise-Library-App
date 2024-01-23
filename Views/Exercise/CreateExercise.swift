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
    @Environment(\.modelContext) private var context
    
    @State private var exerciseName: String = "Exercise Name"
    @State private var sets: String = "3"
    @State private var reps: String = "10"
//    @State private var rest: TimeInterval = 0
    @State private var weight: String = "10"
    @State private var notes: String = "Notes"
    
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
        
        Button("Save") {
            exercise.name = exerciseName
        }
       
    }
}

//#Preview {
//    CreateExercise()
//}
