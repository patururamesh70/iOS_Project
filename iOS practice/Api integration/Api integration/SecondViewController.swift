//
//  SecondViewController.swift
//  Api integration
//
//  Created by patururamesh on 08/09/24.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
    func fetchUser(){
       
        let endpoint = "https://dog.ceo/api/breeds/image/random"
        guard let url = URL(string: endpoint) else { return }
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            
        guard let data = data else { return }
           
        if error == nil {
        let tasks = try! JSONDecoder().decode(User.self , from: data)
                print(tasks)
            }
            
        }
        task.resume()
        
    }

}

struct User: Codable {
    let message: String
    let status: String
}
