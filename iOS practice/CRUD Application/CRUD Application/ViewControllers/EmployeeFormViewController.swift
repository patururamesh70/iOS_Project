//
//  EmployeeFormViewController.swift
//  CRUD Application
//
//  Created by patururamesh on 06/11/24.
//

import UIKit

class EmployeeFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Define text fields programmatically
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Phone"
        textField.keyboardType = .phonePad
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select Gender"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    // Gender options and picker view
    let genderOptions = ["Male", "Female"]
    let genderPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGenderPicker()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // StackView to hold all the text fields and the button
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, phoneTextField, genderTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Save button
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        // StackView Constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupGenderPicker() {
        // Set the picker’s data source and delegate
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderTextField.inputView = genderPicker
        
        // Add a toolbar with a done button to dismiss the picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissPicker))
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        genderTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissPicker() {
        genderTextField.resignFirstResponder()
    }
    
    // MARK: - UIPickerViewDataSource and UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genderOptions[row]
    }

    @objc func saveButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let phone = phoneTextField.text, !phone.isEmpty,
              let gender = genderTextField.text, !gender.isEmpty else {
            print("Please fill all fields")
            return
        }

        // Save to Core Data
        CoreDataManager.shared.saveEmployee(name: name, email: email, phone: phone, gender: gender)

        // Send to server
        if let employee = CoreDataManager.shared.fetchEmployees().last {
            ApiService.shared.createUser(employee: employee) { success in
                DispatchQueue.main.async {
                    if success {
                        print("Employee saved to server")
                    } else {
                        print("Failed to save employee to server")
                    }
                }
            }
        }
    }
}
