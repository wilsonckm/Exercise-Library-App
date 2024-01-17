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
         waist = "Waist",
         none = "None"
    var id: Self { self }
}

enum target: String, CaseIterable, Identifiable {
    case abductors = "Abductors",
         abs = "Abs",
         adductors = "Adductors",
         biceps = "Biceps",
         calves = "Calves",
         cardiovascularSystem = "Cardiovascular System",
         delts = "Delts",
         forearms = "Forearms",
         glutes = "Glutes",
         hamstrings = "Hamstrings",
         lats = "Lats",
         levatorScapulae = "Levator Scapulae",
         pectorals = "Pectorals",
         quads = "Quads",
         serratusAnterior = "Serratus Anterior",
         spine = "Spine",
         traps = "Traps",
         triceps = "Triceps",
         upperBack = "Upper Back",
         none = "None"

    var id: Self { self }
}

