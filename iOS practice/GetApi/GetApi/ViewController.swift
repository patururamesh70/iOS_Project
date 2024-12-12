//
//  ViewController.swift
//  GetApi
//
//  Created by patururamesh on 20/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define the URL
        guard let url = URL(string: "https://airport-info.p.rapidapi.com/airport?iata=BLR&icao=VOBL") else {
            print("Invalid URL")
            return
        }
        
        // Create the request
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        // Specify headers
        let headers = [
            "x-rapidapi-host": "airport-info.p.rapidapi.com",
            "x-rapidapi-key": "00ab76053cmshfb85d0da8ddbadcp1bb580jsn5e5e619aa0e0"
        ]
        request.allHTTPHeaderFields = headers
        
        // Specify HTTP method
        request.httpMethod = "GET"
        
        // Create the URL session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // Ensure there is data
            guard let data = data else {
                print("No data received")
                return
            }
            
            // JSON Parsing
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("JSON Response: \(json)")
                }
            } catch {
                print("JSON Parsing Error: \(error.localizedDescription)")
            }
        }
        
        // Start the task
        dataTask.resume()
    }
}
