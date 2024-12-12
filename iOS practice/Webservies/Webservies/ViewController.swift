//
//  ViewController.swift
//  Webservies
//
//  Created by patururamesh on 23/07/24.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var tableview: UITableView!
    var tasks: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
    func fetchUser() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        let urlRequest = URLRequest(url: url!)
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: urlRequest) { data,response, error in
            guard let data = data else { return }
            
            if error == nil {
                let tasks = try! JSONDecoder().decode([Task].self, from: data)
                self.tasks = tasks
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                print(tasks.first?.title ?? "")
            }
        }
        task.resume()
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Taskcell") else { return
        UITableViewCell()}
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }
    
    
}

struct Task: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
