//
//  ListView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/13/24.
//

import SwiftUI

struct ExerciseListView: View {
    
    @State var exercises: [ExerciseAPI]
    @State var selectedExercise: ExerciseAPI?
    
    var body: some View {
        List {
            ForEach(exercises) { e in
                Button(action: {
                    selectedExercise = e
                }, label: {
                    HStack {
                        if let gifUrl = e.gifUrl {
                            AsyncImage(url: URL(string: gifUrl)){
                                image in
                                image
                                    .resizable()
                                    .frame(width: 75, height: 75)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }
                        } else {
                            Image("list-placeholder-image")
                        }
                        VStack(alignment: .leading) {
                            Text(e.name?.capitalized ?? "No Name Found")
                                .font(Font.system(size: 15))
                                .bold()
                            Text(e.target?.capitalized ?? "No Target Found")
                                .font(Font.system(size: 16))
                                .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                            Text(e.equipment?.capitalized ?? "No Equipment Found")
                                .font(Font.system(size: 16))
                                .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                        }
                    }
                })
            }
        }
        .listStyle(.plain)
        .sheet(item: $selectedExercise) { item in
            ExerciseDetailView(exercise: item)
        }
    }
}

#Preview {
    ExerciseListView(exercises: ([ExerciseAPI(bodyPart: "shoulders", equipment: "band", gifUrl: "https://v2.exercisedb.io/image/whon-vU7j3m08S", id: "0977", name: "band front lateral raise", target: "delts", secondaryMuscles: [
        "traps",
        "upper back"
      ], instructions: [
        "Stand with your feet shoulder-width apart and hold the band in front of your thighs with your palms facing down.",
        "Keep your arms straight and lift the band up in front of you until your arms are parallel to the ground.",
        "Pause for a moment at the top, then slowly lower the band back down to the starting position.",
        "Repeat for the desired number of repetitions."
      ])]), selectedExercise: nil)
}
