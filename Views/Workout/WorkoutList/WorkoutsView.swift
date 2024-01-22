//
//  Workouts.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/8/24.
//

import SwiftUI

struct WorkoutsView: View {
    var body: some View {
        VStack() {
            HStack {
                Text("Workouts")
                        .font(.title)
                Spacer()
//                Image(systemName: "arrow.up.arrow.down")
                Image(systemName: "plus")
            }
                WorkoutListView()
        }
        .padding()
        
        
    }
}

#Preview {
    WorkoutsView()
}
