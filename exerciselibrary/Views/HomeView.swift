//
//  HomeView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/8/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            WorkoutsView()
                .tabItem {
                    VStack {
                        Image(systemName: "photo")
                        Text("Workouts")
                    }
                }
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "menucard")
                        Text("Search")
                    }
                }
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "info.circle")
                        Text("Profile")
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}
