//
//  WorkoutDetailView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    var workout: Workout
//    @Binding var path: NavigationPath
    
    var body: some View {
        Text(workout.name)
        Text(workout.workoutType)
        Text(workout.intensityLevel)
        Text(workout.notes)
    }
}

//#Preview {
//    WorkoutDetailView(workout: Workout())
//}
