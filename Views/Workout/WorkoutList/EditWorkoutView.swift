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
    var workout: Workout
    @State var isEditMode: Bool
    @State var showExercisePicker = false
    
    //form
    @State var workoutName: String = ""
    @State var workoutType: String = ""
    @State var intensityLevel: String = ""
    @State var notes: String = ""
    @State var exercises: [ExerciseLocal] = []
    
    
    var body: some View {
        if isEditMode == true || workout.exercises == [ExerciseLocal]() && workout.name.isEmpty {
            
            // Display Edit Workout View
            Form {
                Section {
                    TextField("Name", text: $workoutName)
                    TextField("Type", text: $workoutType)
                    TextField("Intensity", text: $intensityLevel)
                    TextField("Notes", text: $notes, axis: .vertical)
                    Button("Add Exercises") {
                        showExercisePicker = true
                    }
                }.sheet(isPresented: $showExercisePicker) {
                    SearchView()
                    //                workout.exercises.append(selectedExercise)
                    //                showExercisePicker = false
                }
            }
            .navigationTitle("Edit Workout")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                       // Populate the state variables with the existing workout data
                       workoutName = workout.name
                       workoutType = workout.workoutType
                       intensityLevel = workout.intensityLevel
                       notes = workout.notes
                       exercises = workout.exercises
                   }
            
            Button("Save Workout") {
                isEditMode = false
                addWorkout()
            }.disabled(workoutName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            
        } else {
            
            //Display Workout Detail
            VStack{
                Text(workout.name)
                Text(workout.workoutType)
                Text(workout.intensityLevel)
                Text("Edit")
                    .onTapGesture {
                        isEditMode = true
                    }
            }
        }
        
        
    }
    
    func addWorkout() {
        workout.name = workoutName
        workout.workoutType = workoutType
        workout.intensityLevel = intensityLevel
        workout.notes = notes
        modelContext.insert(workout)
//        path.removeLast()
    }
}

//#Preview {
//    EditWorkoutView()
//}
