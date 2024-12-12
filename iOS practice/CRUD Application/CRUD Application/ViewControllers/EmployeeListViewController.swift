//
//  EmployeeListViewController.swift
//  CRUD Application
//
//  Created by patururamesh on 06/11/24.
//

import UIKit

class EmployeeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Create a table view programmatically
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "EmployeeCell")
        return tableView
    }()

    var employees = [EmployeeEntity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Fetch employees from Core Data
        employees = CoreDataManager.shared.fetchEmployees()
        
        // Set up the table view
        setupTableView()
    }

    private func setupTableView() {
        // Add the table view to the main view
        view.addSubview(tableView)
        
        // Set the delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set up the table view constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // MARK: - TableView DataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        let employee = employees[indexPath.row]
        cell.textLabel?.text = employee.name
        return cell
    }
    
    // MARK: - TableView Delegate Method (optional)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
        print("Selected employee: \(employees[indexPath.row].name ?? "No Name")")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
