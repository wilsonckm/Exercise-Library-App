//
//  Workouts.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import Foundation
import SwiftData

@Model
class Workouts: Identifiable {
    @Attribute(.unique) var id: String
    var name: String
    var dateCreated: Date
    var dateModified: Date
    var duration: TimeInterval
    var intensityLevel: String
    var completed: Bool
    var exercises: [ExerciseAPI]
    var notes: String
    
    init(id: String, name: String, dateCreated: Date, dateModified: Date, duration: TimeInterval, intensityLevel: String, completed: Bool, exercises: [ExerciseAPI], notes: String) {
        self.id = id
        self.name = name
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        self.duration = duration
        self.intensityLevel = intensityLevel
        self.completed = completed
        self.exercises = exercises
        self.notes = notes
    }
}
