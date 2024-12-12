//
//  ViewController.swift
//  Api2
//
//  Created by patururamesh on 18/10/24.
//

import UIKit
import Foundation

// Post model to represent data
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the PATCH request when the view loads
        patchPost(postId: 1)
    }
    
    // MARK: - PATCH Request
    func patchPost(postId: Int) {
        // Step 1: Create the URL for the request
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)") else {
            print("Invalid URL")
            return
        }
        
        // Step 2: Create the request and set HTTP method to PATCH
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        // Step 3: Data to patch (only the "title" field)
        let patchData = ["title": "Partially Updated Title"]
        
        // Step 4: Serialize the data into JSON format
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: patchData, options: [])
            request.httpBody = jsonData
        } catch {
            print("Failed to serialize patch data: \(error.localizedDescription)")
            return
        }
        
        // Step 5: Set request headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Step 6: Use URLSession to send the PATCH request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Step 7: Handle errors
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // Step 8: Ensure there's data to process
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Step 9: Try to decode the response into the Post model
            do {
                let responsePost = try JSONDecoder().decode(Post.self, from: data)
                print("Partially Updated Post: \(responsePost)")
                
                // Optional: Update the UI on the main thread if necessary
                DispatchQueue.main.async {
                    // Perform any UI updates if needed
                }
                
            } catch {
                print("Failed to decode response: \(error.localizedDescription)")
            }
        }
        
        // Step 10: Start the network task
        task.resume()
    }
}

