//
//  EmployeeDetailViewController.swift
//  CRUD Application
//
//  Created by patururamesh on 06/11/24.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    
    // Define labels programmatically
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    var employee: EmployeeEntity?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        displayEmployeeDetails()
    }

    private func setupUI() {
        // StackView to hold labels
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel, phoneLabel, genderLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Buttons for edit and delete
        let editButton = UIButton(type: .system)
        editButton.setTitle("Edit", for: .normal)
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        
        let deleteButton = UIButton(type: .system)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        let buttonStackView = UIStackView(arrangedSubviews: [editButton, deleteButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        // Constraints for StackView and Buttons
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            buttonStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func displayEmployeeDetails() {
        guard let employee = employee else { return }
        nameLabel.text = "Name: \(employee.name ?? "N/A")"
        emailLabel.text = "Email: \(employee.email ?? "N/A")"
        phoneLabel.text = "Phone: \(employee.phone ?? "N/A")"
        genderLabel.text = "Gender: \(employee.gender ?? "N/A")"
    }

    @objc func editButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let editVC = storyboard.instantiateViewController(withIdentifier: "EmployeeFormViewController") as? EmployeeFormViewController {
            //editVC.isEditMode = true
            //editVC.employeeToEdit = employee
            navigationController?.pushViewController(editVC, animated: true)
        }
    }

    @objc func deleteButtonTapped() {
        guard let employee = employee, let email = employee.email else { return }

        // Delete from Core Data
        CoreDataManager.shared.deleteEmployee(employee: employee)

        // Delete from server
        ApiService.shared.deleteUser(email: email) { success in
            DispatchQueue.main.async {
                if success {
                    print("Employee deleted from server")
                } else {
                    print("Failed to delete employee from server")
                }
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
