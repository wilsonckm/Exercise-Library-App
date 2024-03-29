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
            //Move search view into Add exercises in edit workout view
//            SearchView()
//                .tabItem {
//                    VStack {
//                        Image(systemName: "magnifyingglass")
//                        Text("Library")
//                    }
//                }
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
