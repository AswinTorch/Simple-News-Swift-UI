//
//  NetworkManager.swift
//  Torch News
//
//  Created by Aswin Nair on 8/25/20.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var articles = [Article]()
    
    func fetchTopHeadlines() {
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=3370934136884088840d28e714e64cc1") {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                // Only runs if there are no errors
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        do {
                            // Takes the data and decodes it into Results object
                            let results = try decoder.decode(Results.self, from: safeData)
                            
                            // Then update the published var in main thread
                            DispatchQueue.main.async {
                                self.articles = results.articles
                            }
                        } catch {
                            print("Error in decoding: ", error)
                        }
                    }
                }
            }
            
            // Start task
            task.resume()
        }
    }
}
