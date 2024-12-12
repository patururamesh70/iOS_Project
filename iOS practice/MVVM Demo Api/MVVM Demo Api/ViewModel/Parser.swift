//
//  Parser.swift
//  MVVM Demo Api
//
//  Created by patururamesh on 08/09/24.
//

import Foundation

struct Parser {
    
    func parse(completion: @escaping ([Welcome]) -> Void) {
        let endpoint = "https://jsonplaceholder.typicode.com/todos"
        guard let url = URL(string: endpoint) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let tasks = try JSONDecoder().decode([Welcome].self, from: data)
                completion(tasks)
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume()
    }
}
