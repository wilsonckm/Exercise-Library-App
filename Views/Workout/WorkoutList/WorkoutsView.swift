//
//  Workouts.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/8/24.
//

import SwiftUI
import SwiftData

struct WorkoutsView: View {
    
    @State private var path = NavigationPath()
    @Query var workouts: [Workout]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                HStack {
                    Text("Workouts")
                        .font(.title)
                    Spacer()
                    
                    Button(action: {
                        let newWorkout = Workout(id: UUID().uuidString, name: "", dateCreated: Date(), dateModified: Date(), duration: 000, workoutType: "", intensityLevel: "", completed: false, exercises: [ExerciseLocal](), notes: "")
                        path.append(newWorkout)
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                .padding()
            }
            WorkoutListView()
                .navigationDestination(for: Workout.self) { workout in
                    EditWorkoutView(path: $path, workout: workout, isNewWorkout: false)
                    
                }
        }
    }
}

#Preview {
    WorkoutsView()
}
