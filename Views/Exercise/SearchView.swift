//
//  SearchView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/13/24.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    //API search
    @State private var exercises = [ExerciseAPI]()
    @State private var query = ""
    @State private var isLoading = false
    @State private var searchByTab = 0
    @State private var targetQuery: target = .none
    @State private var bodyPartQuery: bodyPart = .none

    var service = DataService()
    
    var body: some View {
        VStack() {
            HStack {
                Text("Exercise Search")
                    .bold()
                    .font(.system(size: 40))
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
            
            //Query by: Name
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
                        .tint(.gray)
                        
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
                    Text("No Exercises Found")
                    Spacer()
                }
                
            } else if exercises.isEmpty && isLoading == true  {
                VStack{
                    ProgressView("Loading...")
                    Spacer()
                }
            } else {
                ExerciseListView(exercises: exercises)
                }
            
        }
        .padding()

    }
}

#Preview {
    SearchView()
}
