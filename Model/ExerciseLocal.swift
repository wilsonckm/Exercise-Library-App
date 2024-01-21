//
//  ExerciseLocal.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import Foundation
import SwiftData

@Model
class ExerciseLocal: Identifiable {
    @Attribute(.unique) var id: String
    var apiID: String
    var name: String
    var bodyPart: String
    var equipment: String
    var target: String
    var secondaryMuscles: [String]
    var instructions: [String]
    
    // User-specific properties
    var sets: Int
    var reps: Int
    var rest: TimeInterval
    var weight: Double
    var notes: String
    
    init(id: String, apiID: String, name: String, bodyPart: String, equipment: String, target: String, secondaryMuscles: [String], instructions: [String], sets: Int, reps: Int, rest: TimeInterval, weight: Double, notes: String) {
        self.id = id
        self.apiID = apiID
        self.name = name
        self.bodyPart = bodyPart
        self.equipment = equipment
        self.target = target
        self.secondaryMuscles = secondaryMuscles
        self.instructions = instructions
        self.sets = sets
        self.reps = reps
        self.rest = rest
        self.weight = weight
        self.notes = notes
    }
    
}
