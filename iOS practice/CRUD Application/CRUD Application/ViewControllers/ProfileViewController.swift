//
//  ProfileViewController.swift
//  CRUD Application
//
//  Created by patururamesh on 07/11/24.
//
import UIKit

class ProfileViewController: UIViewController {

    // Declare text fields for Personal Information
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let dobTextField = UITextField()
    let mobileNumberTextField = UITextField()
    let genderTextField = UITextField()
    
    // Declare text fields for Employment Details
    let companyNameTextField = UITextField()
    let designationTextField = UITextField()
    let yearsOfExpTextField = UITextField()
    
    // Declare buttons
    let editButton = UIButton(type: .system)
    let deleteButton = UIButton(type: .system)
    
    // Declare profile image view
    let profileImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up UI elements
        setupProfileImage()
        setupTextFields()
        setupButtons()
        layoutUIElements()
        
        // Set up Gender Button within the genderTextField
        setupGenderButton()
    }

    func setupProfileImage() {
        profileImageView.image = UIImage(systemName: "person.circle")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
    }

    func setupTextFields() {
        configureTextField(nameTextField, placeholder: "Name")
        configureTextField(emailTextField, placeholder: "Email")
        configureTextField(dobTextField, placeholder: "DOB")
        configureTextField(mobileNumberTextField, placeholder: "Mobile Number")
        configureTextField(genderTextField, placeholder: "Gender")
        
        configureTextField(companyNameTextField, placeholder: "Company Name")
        configureTextField(designationTextField, placeholder: "Designation")
        configureTextField(yearsOfExpTextField, placeholder: "Years of Exp")
    }
    
    func configureTextField(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
    }

    func setupButtons() {
        editButton.setTitle("Edit", for: .normal)
        editButton.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)
        
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.systemRed, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteProfile), for: .touchUpInside)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButton)
    }
    
    func setupGenderButton() {
        // Add a button on the right side of genderTextField to show options
        let genderButton = UIButton(type: .system)
        genderButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        genderButton.addTarget(self, action: #selector(showGenderOptions), for: .touchUpInside)
        genderButton.translatesAutoresizingMaskIntoConstraints = false

        // Add the button to the right side of genderTextField
        genderTextField.rightView = genderButton
        genderTextField.rightViewMode = .always
    }

    @objc func showGenderOptions() {
        // Create an alert controller to act as a dropdown menu
        let alertController = UIAlertController(title: "Select Gender", message: nil, preferredStyle: .actionSheet)
        
        let maleAction = UIAlertAction(title: "Male", style: .default) { _ in
            self.genderTextField.text = "Male"
        }
        
        let femaleAction = UIAlertAction(title: "Female", style: .default) { _ in
            self.genderTextField.text = "Female"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(maleAction)
        alertController.addAction(femaleAction)
        alertController.addAction(cancelAction)
        
        // Present the alert controller
        present(alertController, animated: true, completion: nil)
    }

    func layoutUIElements() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            dobTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            dobTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            dobTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            mobileNumberTextField.topAnchor.constraint(equalTo: dobTextField.bottomAnchor, constant: 10),
            mobileNumberTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            mobileNumberTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            genderTextField.topAnchor.constraint(equalTo: mobileNumberTextField.bottomAnchor, constant: 10),
            genderTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            genderTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            companyNameTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 20),
            companyNameTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            companyNameTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            designationTextField.topAnchor.constraint(equalTo: companyNameTextField.bottomAnchor, constant: 10),
            designationTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            designationTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            yearsOfExpTextField.topAnchor.constraint(equalTo: designationTextField.bottomAnchor, constant: 10),
            yearsOfExpTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            yearsOfExpTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            editButton.topAnchor.constraint(equalTo: yearsOfExpTextField.bottomAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            deleteButton.topAnchor.constraint(equalTo: yearsOfExpTextField.bottomAnchor, constant: 20),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // Actions for buttons
    @objc func editProfile() {
        // Handle edit profile action
    }
    
    @objc func deleteProfile() {
        // Handle delete profile action
    }
}
