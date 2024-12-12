//
//  EmployeeDetailViewController.swift
//  CRUD ApplicationTask
//
//  Created by patururamesh on 06/11/24.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    private let viewModel: EmployeeDetailViewModel
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let mobileLabel = UILabel()
    private let genderLabel = UILabel()
    private let deleteButton = UIButton(type: .system)
    private let editButton = UIButton(type: .system)

    init(employee: EmployeeEntity) {
        self.viewModel = EmployeeDetailViewModel(employee: employee)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureData()
        setupActions()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Employee Details"
        
        nameLabel.textAlignment = .center
        emailLabel.textAlignment = .center
        mobileLabel.textAlignment = .center
        genderLabel.textAlignment = .center
        deleteButton.setTitle("Delete Employee", for: .normal)
        editButton.setTitle("Edit Employee", for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel, mobileLabel, genderLabel, editButton, deleteButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func configureData() {
        nameLabel.text = "Name: \(viewModel.employee.name ?? "N/A")"
        emailLabel.text = "Email: \(viewModel.employee.email ?? "N/A")"
        mobileLabel.text = "Mobile: \(viewModel.employee.mobile ?? "N/A")"
        genderLabel.text = "Gender: \(viewModel.employee.gender ?? "N/A")"
    }

    private func setupActions() {
        deleteButton.addTarget(self, action: #selector(deleteEmployee), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editEmployee), for: .touchUpInside)
    }

    @objc private func deleteEmployee() {
        viewModel.deleteEmployee { [weak self] success in
            if success {
                self?.navigationController?.popViewController(animated: true)
            } else {
                print("Failed to delete employee")
            }
        }
    }

    @objc private func editEmployee() {
        let editVC = EmployeeEditViewController(employee: viewModel.employee)
        navigationController?.pushViewController(editVC, animated: true)
    }
}

