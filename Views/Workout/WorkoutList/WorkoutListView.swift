//
//  WorkoutListView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import SwiftUI
import SwiftData

struct WorkoutListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var workouts: [Workout]
    @Binding var path: NavigationPath
    
    var body: some View {
        if workouts.isEmpty {
            VStack {
                Spacer()
                Text("Create a workout!")
            }
        }
        List {
            ForEach(workouts) { workout in
                NavigationLink(value: workout) {
                    WorkoutCardView(workout: workout)
                }
            }
            .onDelete(perform: deleteWorkout)
        }
        .listStyle(.plain)
        .navigationDestination(for: Workout.self) { workout in
            EditWorkoutView(path: $path, workout: workout, isEditMode: false)
        }
    }
    
    func deleteWorkout(at offsets: IndexSet) {
        for offset in offsets {
            let workout = workouts[offset]
            modelContext.delete(workout)
        }
    }
}
////#Preview {
////    WorkoutListView()
////}
