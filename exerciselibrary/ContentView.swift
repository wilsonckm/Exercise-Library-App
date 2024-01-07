//
//  ContentView.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            Task {
                await apiCall()
            }
        }
    }
    
    func apiCall() async {
        // Gets URL + Optional binding to handle URL
        if let url = URL(string: "https://exercisedb.p.rapidapi.com/exercises?limit=10") {
            
            //URL request with multiple headers: use setValue rather than addValue! or use .allHTTPHeaderFields
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = [
                   "X-RapidAPI-Key": "API-KEY",
                   "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
               ]

            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode([Exercise].self, from: data)
                    print(result)
                    
                }
                catch {
                    print(error)
                }
            }
            catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}

