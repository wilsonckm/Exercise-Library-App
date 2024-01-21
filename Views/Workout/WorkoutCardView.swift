//
//  WorkoutCardView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import SwiftUI

struct WorkoutCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color("Seashell"))
            VStack {
                HStack {
                    VStack {
                        Text("12")
                        Text("Mar")
                    }
                    Spacer()
                    VStack (alignment: .trailing) {
                        Text("WorkoutTitle")
                            .font(.headline)
                        VStack {
                            HStack {
                                Text("WorkoutType |")
                                    .font(.subheadline)
                                Text("Exercise Type")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    WorkoutCardView()
}
