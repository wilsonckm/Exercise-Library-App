//
//  WorkoutListView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import SwiftUI
import SwiftData

struct WorkoutListView: View {
    @Query var workout: [Workout]
    
    var body: some View {
        if workout.isEmpty {
            VStack {
                Spacer()
                Text("No workouts yet!")
                Spacer()
            }
            
        } else {
            ScrollView {
                ForEach(workout){ w in
                    WorkoutCardView(workout: w)
                }
            }
        }
    }
}

#Preview {
    WorkoutListView()
}
