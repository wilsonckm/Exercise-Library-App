//
//  WorkoutDetailView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    var workout: Workout
    
    var body: some View {
        Text(workout.name)
    }
}

//#Preview {
//    WorkoutDetailView(workout: Workout())
//}
