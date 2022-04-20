//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Miguel Solans on 25/03/2022.
//

import Foundation

// ObservableObject: able to broadcast changes
class NetworkManager: ObservableObject {
    
    // if any given class has subscribed for changes in posts, will receive updates
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string:"https://hn.algolia.com/api/v1/search?tags=front_page") {
         
            let session = URLSession(configuration: .default);
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if(error == nil) {
                    // If there was no error, we have received data
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}
