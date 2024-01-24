//
//  WorkoutCardView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import SwiftUI

struct WorkoutCardView: View {
    
    var workout: Workout
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color("Seashell"))
            VStack {
                HStack {
                    VStack {
                        Text(DateFormatHelper.dayOfMonth(date: workout.dateCreated))
                        Text(DateFormatHelper.abbreviateMonth(date: workout.dateCreated))
                    }
                    Spacer()
                    VStack (alignment: .trailing) {
                        Text(workout.name)
                            .font(.headline)
                        VStack {
                            HStack {
                                Text("\(workout.workoutType) |")
                                    .font(.subheadline)
                                Text("\(workout.intensityLevel)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

//#Preview {
//    WorkoutCardView(workout: Workout(id: "123", name: "Leg Day", dateCreated: Date(), dateModified: Date(), duration: 3600, workoutType: "Strength", intensityLevel: "Hard", completed: true, exercises: [ExerciseLocal](), notes: "Wow"))
//}
