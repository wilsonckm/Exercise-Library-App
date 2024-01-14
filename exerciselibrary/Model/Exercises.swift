//
//  Exercises.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/5/24.
//

import Foundation

struct Exercise: Decodable, Identifiable {
    var bodyPart: String?
    var equipment: String?
    var gifUrl: String?
    var id: String?
    var name: String?
    var target: String?
    var secondaryMuscles: [String]?
    var instructions: [String]?
}

enum bodyPart: String, CaseIterable, Identifiable {
    case back = "Back",
         cardio = "Cardio",
         chest = "Chest",
         lowerArms = "Lower Arms",
         lowerLegs = "Lower Legs",
         neck = "Neck",
         shoulders = "Shoulders",
         upperArms = "Upper Arms",
         upperLegs = "Upper Legs",
         waist = "Waist"
    var id: Self { self }
}



