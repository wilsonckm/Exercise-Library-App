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
    
    var body: some View {
        List {
            ForEach(workouts) { workout in
                NavigationLink(value: workout) {
                    WorkoutCardView(workout: workout)
                }
            }
            .onDelete(perform: deleteWorkout)
        }
        .listStyle(.plain)
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
