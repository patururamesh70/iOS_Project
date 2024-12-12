//
//  ViewController.swift
//  MVVM Demo Api
//
//  Created by patururamesh on 08/09/24.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let parser = Parser()
    var welcomes = [Welcome]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        parser.parse { [weak self] data in
            self?.welcomes = data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return welcomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = welcomes[indexPath.row].title
        return cell
    }
}
