//
//  DataService.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/6/24.
//

import Foundation

struct DataService {

    func exerciseSearch() async -> [Exercise] {
        // Gets API key as an optional string from the infoplist
        let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
        
        //Checks if API key exists. Guard is used here to handle missing/invalid api key.
        guard apiKey != nil else {
            //if no api key will return empty exercise array
            return [Exercise]()
        }
        
        // Gets URL + Optional binding to handle URL
        if let url = URL(string: "https://exercisedb.p.rapidapi.com/exercises?limit=10") {
            
            //URL request with multiple headers: use setValue rather than addValue! or use .allHTTPHeaderFields
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = [
                "X-RapidAPI-Key": "\(apiKey!)",
                "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
            ]
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                if let httpResponse = response as? HTTPURLResponse {
                    //Checks of status code is between 200 and 299 (Successful response)
                    if (200..<300).contains(httpResponse.statusCode) {
                        //Decode the JSON data received from the API
                        let decoder = JSONDecoder()
                        do {
                            let result = try decoder.decode([Exercise].self, from: data)
                            
                            //Make sure you return the result or it defaults to returning an empty array!
                            return result
                        }
                        catch {
                            //Catches possible decoding error.
                            print("Decoding error: \(error)")
                        }
                    } else {
                        // Handle non-successful HTTP status codes
                        print("HTTP status code: \(httpResponse.statusCode)")
                    }
                } else {
                    //Handle unexpected non-HTTP response
                    print("Unexpected response type")
                }
            } catch {
                //Handle URLSession errors
                print("URLSession error: \(error)")
            }
        }
        return [Exercise]()
    }
    
}

