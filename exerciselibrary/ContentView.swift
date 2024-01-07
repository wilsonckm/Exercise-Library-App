//
//  ContentView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/4/24.
//

import SwiftUI

struct ContentView: View {
    
    var service = DataService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("")
        }
        .padding()
        .task {
            await service.exerciseSearch()
        }
        
    }
}


#Preview {
    ContentView()
}

