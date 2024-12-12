//
//  EmployeeDetailsViewController.swift
//  CRUD_ Application
//
//  Created by patururamesh on 07/11/24.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display employee details
    }
    
    @objc func editEmployee() {
        // Navigate to EmployeeFormViewController with employee data
    }
    
    @objc func deleteEmployee() {
        guard let email = employee?.email else { return }
        deleteEmployeeAPI(email: email)
    }
    
    private func deleteEmployeeAPI(email: String) {
        let url = URL(string: "https://sandbox.cynergytx.com/system-task/deletUser")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = ["email": email]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error:", error)
                return
            }
            // Update Core Data and UI
        }.resume()
    }
}
