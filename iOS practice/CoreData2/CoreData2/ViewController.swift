//
//  ViewController.swift
//  CoreData2
//
//  Created by patururamesh on 16/09/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var carsListView: UITableView!
    var cars: [Car] = []
     
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        readCars()
    }
    func readCars() {
        cars = CoreDataManager.shared.fetch()
        print(cars)
        carsListView.reloadData()
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Carcell") else { return UITableViewCell() }
            
        let aCar = cars[indexPath.row]
        cell.textLabel?.text = aCar.brand
        cell.detailTextLabel?.text = aCar.colour
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aCar = cars[indexPath.row]
        aCar.brand = "Updated Brand"
        CoreDataManager.shared.saveContext()
        readCars()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let car = cars[indexPath.row]
        CoreDataManager.shared.delete(car: car)
        readCars()
    }
    
    
}
