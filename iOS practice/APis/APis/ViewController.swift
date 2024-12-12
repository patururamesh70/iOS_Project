//
//  ViewController.swift
//  APis
//
//  Created by patururamesh on 16/09/24.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Adding a button to trigger the alert
        let showAlertButton = UIButton(type: .system)
        showAlertButton.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        showAlertButton.setTitle("Show Alert", for: .normal)
        showAlertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        self.view.addSubview(showAlertButton)
    }
    
    @objc func showAlert() {
        // Create the alert controller
        let alert = UIAlertController(title: "Login", message: "Enter your credentials", preferredStyle: .alert)
        
        // Add text fields to the alert
        alert.addTextField { (textField) in
            textField.placeholder = "Username"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        // Add actions to the alert
        let loginAction = UIAlertAction(title: "Login", style: .default) { _ in
            let username = alert.textFields![0].text
            let password = alert.textFields![1].text
            self.handleLogin(username: username, password: password)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Add actions to the alert controller
        alert.addAction(loginAction)
        alert.addAction(cancelAction)
        
        // Present the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func handleLogin(username: String?, password: String?) {
        // Handle the login logic here
        if let username = username, let password = password {
            print("Username: \(username), Password: \(password)")
            // You can add further validation or navigation here
            if username.isEmpty || password.isEmpty {
                showErrorAlert(message: "Both fields are required.")
            } else if username == "test" && password == "password" {
                showSuccessAlert(message: "Login Successful!")
            } else {
                showErrorAlert(message: "Invalid credentials.")
            }
        }
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
