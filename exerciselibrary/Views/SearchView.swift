//
//  SearchView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/13/24.
//

import SwiftUI

struct SearchView: View {
    @State private var exercises = [Exercise]()
    @State private var query = ""
    @State private var isLoading = false
    @State private var searchByTab = 0
    @State private var targetQuery: target = .none
    @State private var bodyPartQuery: bodyPart = .none
    @State private var selectedExercise: Exercise?
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
                Text("Target Muscle")
                    .tag(1)
                Text("Body Part")
                    .tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            //Query by name
            if searchByTab == 0 {
                VStack {
                    HStack {
                        TextField("Search Exercises", text: $query)
                            .textFieldStyle(.roundedBorder)
                        Button("Search") {
                            Task {
                                isLoading = true
                                exercises = await service.exerciseSearch(query: query, bodyPart: "", target: "")
                                isLoading = false
                            }
                        }
                        .buttonStyle(.bordered)
                        .tint(.black)
                    }
                }
            //Query by Target
            } else if searchByTab == 1 {
                HStack {
                    Text("Target Muscle")
                        .bold()
                    Spacer()
                    Picker("Target Muscle", selection: $targetQuery) {
                        ForEach(target.allCases) { item in
                            Text(item.rawValue).tag(item)
                        }
                    }
                    .tint(.gray)
                    .onChange(of: targetQuery) { oldValue, newValue in
                        Task {
                            isLoading = true
                            exercises = await service.exerciseSearch(query: "", bodyPart: "", target: targetQuery.rawValue)
                            isLoading = false
                        }
                    }
                }
                
            //Query by body part
            } else if searchByTab == 2 {
                HStack {
                    Text("Body Part")
                        .bold()
                    Spacer()
                    Picker("Body Part", selection: $bodyPartQuery) {
                        ForEach(bodyPart.allCases) { item in
                            Text(item.rawValue).tag(item)
                        }
                    }
                    .tint(.gray)
                    .onChange(of: bodyPartQuery) { oldValue, newValue in
                        Task {
                            isLoading = true
                            exercises = await service.exerciseSearch(query: "", bodyPart: bodyPartQuery.rawValue, target: "")
                            isLoading = false
                        }
                    }
                }
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
