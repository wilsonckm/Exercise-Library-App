//
//  ExerciseDetailView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/8/24.
//

import SwiftUI
import SwiftData

struct ExerciseDetailView: View {
    
//    @Environment(\.modelContext) var modelContext
    
    var exercise: ExerciseAPI?
//   @Query var exerciseLocal: ExerciseLocal
    
    
    //ExerciseAPI to ExerciseLocal download. Saves API exercise into local swiftdata storage
    @State private var exerciseName: String = ""
    @State private var exerciseBodyPart: String = ""
    @State private var exerciseGifUrl: String = ""
    @State private var exerciseEquipment: String = ""
    @State private var exerciseTarget: String = ""
    @State private var exerciseSecondaryMuscles: [String] = []
    @State private var exerciseInstructions: [String] = []
    
    
    var body: some View {
        VStack {
            if let url = exercise?.gifUrl {
                GifImage(url)
            } else {
                Image("detail-placeholder-image")
            }
        }
        
        ScrollView {
            VStack (alignment: .leading) {
                HStack {
                    Text(exercise?.name?.capitalized ?? "Exercise Title")
                        .bold()
                        .font(.title)
                    Spacer()
                    Image(systemName: "heart")
                }
                Text("Primary Muscle: ")
                    .bold() + Text(exercise?.target?.capitalized ?? "Target Muscle")
                
                //Lists out secondary muscles from the array, capitalizes first letter, then joins them with a separator.
                
                Text("Secondary Muscles: ")
                    .bold() + Text(exercise?.secondaryMuscles?.map { $0.capitalized }.joined(separator: ", ") ?? "No secondary muscle")
                
                Text("Equipment: ")
                    .bold() + Text(exercise?.equipment?.capitalized ?? "No equipment needed") + Text("\n")
                
                //Iterates through the instructions array and numbers them
                if let exercise = exercise {
                    let numberedInstructions = exercise.instructions?.enumerated().map {index, instruction in
                        "\(index + 1). \(instruction)"
                    }.joined(separator: "\n \n") ?? "No exercise instructions"
                    
                    Text("\(numberedInstructions)")
                }
            }
            .padding()
            
            VStack {
                Button(action: {
                    // code to add exercise to workout --> similar to adding songs to a playlist
//                    exerciseLocal.name = exercise?.name
//                    modelContext.insert(exerciseLocal)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue)
                            .frame(height: 50)
                            .padding()
                        Text("Add Exercise")
                            .foregroundStyle(.white)
                    }            })
                
            }
        }
    }
}

//#Preview {
//    ExerciseDetailView(exercise: ExerciseAPI(bodyPart: "shoulders", equipment: "band", gifUrl: "https://v2.exercisedb.io/image/GNnVlGCFnteI8v", id: "0977", name: "band front lateral raise", target: "delts", secondaryMuscles: [
//                "traps",
//                "upper back"
//              ], instructions: [
//                "Stand with your feet shoulder-width apart and hold the band in front of your thighs with your palms facing down.",
//                "Keep your arms straight and lift the band up in front of you until your arms are parallel to the ground.",
//                "Pause for a moment at the top, then slowly lower the band back down to the starting position.",
//                "Repeat for the desired number of repetitions."
//              ]))
//}
