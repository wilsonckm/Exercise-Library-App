//
//  Workouts.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import Foundation
import SwiftData

@Model
class Workout: Identifiable {
    @Attribute(.unique) var id: String
    var name: String
    var dateCreated: Date
    var dateModified: Date
    var duration: TimeInterval
    var workoutType: String
    var intensityLevel: String
    var completed: Bool
    var exercises: [ExerciseLocal]
    var notes: String
    

    init(id: String, name: String, dateCreated: Date, dateModified: Date, duration: TimeInterval, workoutType: String, intensityLevel: String, completed: Bool, exercises: [ExerciseLocal], notes: String) {
        self.id = id
        self.name = name
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        self.duration = duration
        self.workoutType = workoutType
        self.intensityLevel = intensityLevel
        self.completed = completed
        self.exercises = exercises
        self.notes = notes
    }
}
