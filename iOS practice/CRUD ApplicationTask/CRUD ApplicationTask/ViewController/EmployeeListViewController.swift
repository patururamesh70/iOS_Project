//
//  EmployeeListViewController.swift
//  CRUD ApplicationTask
//
//  Created by patururamesh on 06/11/24.
//

import UIKit

class EmployeeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewModel = EmployeeListViewModel()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.didUpdateEmployees = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.fetchEmployees()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfEmployees()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let employee = viewModel.employee(at: indexPath.row)
        cell.textLabel?.text = employee.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = viewModel.employee(at: indexPath.row)
        let detailVC = EmployeeDetailViewController(employee: employee)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
