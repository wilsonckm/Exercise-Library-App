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
    var target: String?
    var secondaryMuscles = [String]()
    var instructions = [String]()
}

struct ExerciseSearch: Decodable {
    var exercises = [Exercise]()
}


