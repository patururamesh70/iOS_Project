//
//  ViewController.swift
//  Api integration
//
//  Created by patururamesh on 08/09/24.
//

import UIKit

class ViewController: UIViewController {
    

override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
    func fetchUser(){
       
        let endpoint = "https://jsonplaceholder.typicode.com/todos"
        guard let url = URL(string: endpoint) else { return }
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            
        guard let data = data else { return }
           
        if error == nil {
        let tasks = try! JSONDecoder().decode([Users].self , from: data)
                print(tasks)
            }
            
        }
        task.resume()
        
    }

}

struct Users: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

