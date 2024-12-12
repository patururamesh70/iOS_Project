//
//  EmployeeFormViewController.swift
//  CRUD_ Application
//
//  Created by patururamesh on 07/11/24.
//

import UIKit

class EmployeeFormViewController: UIViewController {
    
    // UI elements as per the design
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let dobTextField = UITextField()
    let mobileNumberTextField = UITextField()
    let genderPicker = UIPickerView()
    let genderOptions = ["Male", "Female"]
    let companyNameTextField = UITextField()
    let designationTextField = UITextField()
    let experienceTextField = UITextField()
    
    let saveButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Set up the UI elements, constraints, and add targets/actions
        // Omitted here for brevity
    }
    
    @objc func saveEmployee() {
        // Validate inputs and save data to Core Data and server
        // Call the API below to create/update employee
    }
    
    func createOrUpdateEmployeeAPI(email: String, name: String, dob: String, mobile: String, gender: String, company: String, designation: String, experience: String) {
        let url = URL(string: "https://sandbox.cynergytx.com/system-task/createUser")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "email": email,
            "name": name,
            "dob": dob,
            "mobile": mobile,
            "gender": gender,
            "companyName": company,
            "designation": designation,
            "yearsOfExperience": experience
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error:", error)
                return
            }
            // Handle the response and update Core Data if needed
        }.resume()
    }
}



