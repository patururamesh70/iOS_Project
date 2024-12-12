//
//  EmployeeListViewController.swift
//  CRUD_ Application
//
//  Created by patururamesh on 07/11/24.
//

import UIKit

class EmployeeListViewController: UITableViewController {
    
    var employees: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmployees()
    }
    
    private func fetchEmployees() {
        if isConnectedToInternet() {
            fetchEmployeesFromServer()
        } else {
            fetchEmployeesFromCoreData()
        }
    }
    
    private func fetchEmployeesFromServer() {
        let url = URL(string: "https://sandbox.cynergytx.com/system-task/getAllUsers")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                // Parse JSON, save data to Core Data, and update UI
            }
        }.resume()
    }
    
    private func fetchEmployeesFromCoreData() {
        // Fetch data from Core Data and update `employees` array
    }
}
