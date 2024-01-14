//
//  SearchView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/13/24.
//

import SwiftUI

struct SearchView: View {
    @State var exercises = [Exercise]()
    @State var query = ""
    @State var isLoading = false
    @State var searchByTab = 0
    @State var bodyPartQuery: bodyPart = .back
    @State var selectedExercise: Exercise?
    var service = DataService()
    
    var body: some View {
        VStack() {
            HStack {
                Text("Exercise Search")
                    .bold()
                    .font(.system(size: 32))
                Spacer()
            }
            Picker("", selection: $searchByTab) {
                Text("Name")
                    .tag(0)
                Text("Target")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom)
            
            if searchByTab == 0 {
                VStack {
                    HStack {
                        TextField("Search Exercises", text: $query)
                            .textFieldStyle(.roundedBorder)
                        Button("Search") {
                            Task {
                                isLoading = true
                                exercises = await service.exerciseSearch(query: query, bodyPart: "")
                                isLoading = false
                            }
                        }
                        .buttonStyle(.bordered)
                        .tint(.black)
                    }
//                    Spacer()
                }
            } else if searchByTab == 1 {
                
//                HStack {
                    List {
                        Picker("Target Muscles", selection: $bodyPartQuery) {
                            ForEach(bodyPart.allCases) { item in
                                Text(item.rawValue).tag(item)
                            }
                        }
                            .onChange(of: bodyPartQuery) { oldValue, newValue in
                                Task {
                                    isLoading = true
                                    exercises = await service.exerciseSearch(query: "", bodyPart: bodyPartQuery.rawValue)
                                    isLoading = false
                                }
                        }
                        
                    }
                    .listStyle(.plain)
//                }
                Spacer()
            }
            
            if exercises.isEmpty && isLoading == false {
                VStack {
                    Spacer()
                    Text("Build your next workout!")
                    Spacer()
                }
                
            } else if exercises.isEmpty && isLoading == true  {
                VStack{
                    ProgressView("Loading...")
                    Spacer()
                }
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
        .sheet(item: $selectedExercise) { item in
            ExerciseDetailView(exercise: item)
        }

    }
}

#Preview {
    SearchView()
}