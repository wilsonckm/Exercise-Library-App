//
//  ExerciseLocalListView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/24/24.
//

import SwiftUI
import SwiftData

struct ExerciseLocalListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var exercises: [ExerciseLocal]
    //    @State var selectedExercise: ExerciseLocal
    
    
    var body: some View {
        List {
            ForEach(exercises) { e in
                //                Button(action: {
                //                    selectedExercise = e
                //                }, label: {
                HStack {
                    //                        if let gifUrl = e.gifUrl {
                    //                            AsyncImage(url: URL(string: gifUrl)){
                    //                                image in
                    //                                image
                    //                                    .resizable()
                    //                                    .frame(width: 75, height: 75)
                    //                            } placeholder: {
                    //                                ProgressView()
                    //                                    .frame(width: 50, height: 50)
                    //                            }
                    //                        } else {
                    //                            Image("list-placeholder-image")
                    //                        }
                    VStack(alignment: .leading) {
                        Text(e.name.capitalized)
                            .font(Font.system(size: 15))
                            .bold()
                        Text(e.target.capitalized)
                            .font(Font.system(size: 16))
                            .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                        Text(e.equipment.capitalized)
                            .font(Font.system(size: 16))
                            .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                    }
                }
            }
            .onDelete(perform: deleteExercise)
        }
        .listStyle(.plain)
        //        .sheet(item: $selectedExercise) { item in
        //            ExerciseDetailView(exercise: item)
    }
    func deleteExercise(at offsets: IndexSet) {
        for offset in offsets {
            let exercise = exercises[offset]
            modelContext.delete(exercise)
        }
    }
}
