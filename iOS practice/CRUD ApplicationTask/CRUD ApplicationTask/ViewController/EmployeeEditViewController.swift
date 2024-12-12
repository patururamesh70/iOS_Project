//
//  EmployeeEditViewController.swift
//  CRUD ApplicationTask
//
//  Created by patururamesh on 06/11/24.
//


import UIKit

class EmployeeEditViewController: UIViewController {
    private let viewModel: EmployeeDetailViewModel
    private let nameTextField = UITextField()
    private let mobileTextField = UITextField()
    private let genderSegmentedControl = UISegmentedControl(items: ["Male", "Female"])
    private let saveButton = UIButton(type: .system)

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
        title = "Edit Employee"
        
        nameTextField.placeholder = "Name"
        mobileTextField.placeholder = "Mobile"
        mobileTextField.keyboardType = .phonePad
        saveButton.setTitle("Save", for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField, mobileTextField, genderSegmentedControl, saveButton])
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
        nameTextField.text = viewModel.employee.name
        mobileTextField.text = viewModel.employee.mobile
        genderSegmentedControl.selectedSegmentIndex = (viewModel.employee.gender == "Male") ? 0 : 1
    }

    private func setupActions() {
        saveButton.addTarget(self, action: #selector(saveEmployee), for: .touchUpInside)
    }

    @objc private func saveEmployee() {
        let updatedName = nameTextField.text ?? ""
        let updatedMobile = mobileTextField.text ?? ""
        let updatedGender = (genderSegmentedControl.selectedSegmentIndex == 0) ? "Male" : "Female"
        
        viewModel.updateEmployee(name: updatedName, mobile: updatedMobile, gender: updatedGender)
        navigationController?.popViewController(animated: true)
    }
}

