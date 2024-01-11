//
//  ListView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/8/24.
//

import SwiftUI

struct ListView: View {
    @State var exercises = [Exercise]()
    
    var service = DataService()
    @State var selectedExercise: Exercise?
    
    var body: some View {
        VStack {
            HStack {
                Text("Search Exercises")
                Spacer()
            }
            if exercises.isEmpty {
                ProgressView("Loading...")
            } else {
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
            }
        }
        .padding()
        .task {
            exercises = await service.exerciseSearch()
        }
        .sheet(item: $selectedExercise) { item in
            ExerciseDetailView(exercise: item)
        }
        
    }
}

#Preview {
    ListView()
}
