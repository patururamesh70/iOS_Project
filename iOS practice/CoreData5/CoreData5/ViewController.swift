//
//  ViewController.swift
//  CoreData5
//
//  Created by patururamesh on 20/09/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableview : UITableView!
    var cars : [Car] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        ReadCars()
    }
    func ReadCars() {
        cars = CoreDataManager.shared.fetch()
        print(cars)
        tableview.reloadData()
    }

}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell()}
        cell.textLabel?.text = cars[indexPath.row].brand
        cell.detailTextLabel?.text = cars[indexPath.row].color
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        CoreDataManager.shared.saveContext()
        ReadCars()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aCar = cars [indexPath.row]
        aCar.brand = "Updated brand"
        CoreDataManager.shared.saveContext()
        ReadCars()
    }
    
}
