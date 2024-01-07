//
//  ContentView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var exercises = [Exercise]()
    var service = DataService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            if exercises.isEmpty {
                ProgressView("Loading...")
            } else {
                List(exercises) { exercise in
                    Text(exercise.name ?? "No Name Found")
                }
            }
        }
        .padding()
        .task {
            exercises = await service.exerciseSearch()
        }
        
    }
}


#Preview {
    ContentView()
}

