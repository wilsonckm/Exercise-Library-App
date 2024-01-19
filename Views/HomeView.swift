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
            ChatView()
                .tabItem {
                    VStack {
                        Image(systemName: "bubble.left.fill")
                        Text("Chat")
                    }
                }
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}