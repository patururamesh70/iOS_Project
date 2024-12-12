//
//  ViewController.swift
//  APiIntegartion
//
//  Created by patururamesh on 16/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
    }
    func fetchUser() {
        
        let endPoint = "https://dog.ceo/api/breeds/image/random"
        guard let url = URL(string: endPoint) else { return }
        let urlrequest = URLRequest(url: url)
        let urlsession = URLSession.shared
        
       let task = urlsession.dataTask(with: urlrequest) { data, response,error in
           guard let data = data else { return }
           
           if error == nil {
               let tasks = try! JSONDecoder().decode(user.self, from: data)
               print(tasks)
           }
        }
        task.resume()
    }
}
struct user: Codable {
    let message: String
    let status: String
    
}
