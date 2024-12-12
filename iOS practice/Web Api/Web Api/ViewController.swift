//
//  ViewController.swift
//  Web Api
//
//  Created by patururamesh on 13/08/24.
//

import UIKit


class ViewController: UIViewController {
    
    var images: [String] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchDogImages()
    }
    
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    func fetchDogImages() {
        let urlString = "https://dog.ceo/api/breed/hound/images"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let dogImageResponse = try JSONDecoder().decode(DogImageResponse.self, from: data)
                self.images = dogImageResponse.message
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Reset the imageView and textLabel to avoid reuse issues
        cell.imageView?.image = nil
        cell.textLabel?.text = nil
        
        let imageUrl = images[indexPath.row]
        if let url = URL(string: imageUrl) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        // Ensure the cell is still visible before updating it
                        if let visibleCell = tableView.cellForRow(at: indexPath) {
                            visibleCell.imageView?.image = image
                            visibleCell.textLabel?.text = "Hound Image \(indexPath.row + 1)"
                            visibleCell.setNeedsLayout()
                        }
                    }
                }
            }
            task.resume()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
