//
//  ViewController.swift
//  Alamofire_API
//
//  Created by patururamesh on 04/11/24.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    // UI Components
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        // Add subviews
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        view.addSubview(errorLabel)
        
        // Layout using frames (you can also use AutoLayout)
        emailTextField.frame = CGRect(x: 40, y: 200, width: view.frame.size.width - 80, height: 40)
        passwordTextField.frame = CGRect(x: 40, y: 250, width: view.frame.size.width - 80, height: 40)
        loginButton.frame = CGRect(x: 40, y: 310, width: view.frame.size.width - 80, height: 50)
        signUpButton.frame = CGRect(x: 40, y: 370, width: view.frame.size.width - 80, height: 50)
        errorLabel.frame = CGRect(x: 40, y: 430, width: view.frame.size.width - 80, height: 60)
    }
    
    @objc private func handleLogin() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            errorLabel.text = "Please enter both email and password."
            return
        }
        
        // Firebase Login
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorLabel.text = "Login failed: \(error.localizedDescription)"
                return
            }
            
            self.errorLabel.text = nil
            self.navigateToMainScreen()
        }
    }
    
    @objc private func handleSignUp() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            errorLabel.text = "Please enter both email and password."
            return
        }

        // Firebase Registration
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorLabel.text = "Signup failed: \(error.localizedDescription)"
                return
            }
            
            self.errorLabel.text = nil
            self.navigateToMainScreen()
        }
    }
    
    private func navigateToMainScreen() {
        // Navigate to the main screen
        let mainVC = MainViewController() // Replace this with your main view controller
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
}
