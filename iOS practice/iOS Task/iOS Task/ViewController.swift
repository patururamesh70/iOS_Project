//
//  ViewController.swift
//  iOS Task
//
//  Created by patururamesh on 12/09/24.
//
import UIKit

class ViewController: UIViewController {

    // Outlets for the username and password text fields
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // Login button
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }

    func setupViews() {
        // Add subviews
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

        // Set constraints for UI elements
        NSLayoutConstraint.activate([
            // Username TextField Constraints
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),

            // Password TextField Constraints
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            // Login Button Constraints
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // Handle login button click
    @objc func handleLogin() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            print("Invalid input")
            return
        }

        // Call the login API
        login(username: username, password: password)
    }

    func login(username: String, password: String) {
        let url = URL(string: "https://telugumatches.in/api/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters: [String: String] = [
            "email": username,
            "password": password,
            "device_id": "exzcde"  // Example static device ID
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Login Response: \(json)")
                    
                    // Check for success and navigate to HomeViewController
                    if let success = json["success"] as? Bool, success {
                        DispatchQueue.main.async {
                            self.navigateToHome()
                        }
                    } else {
                        // Handle login failure (e.g., show an alert)
                        DispatchQueue.main.async {
                            self.showLoginError()
                        }
                    }
                }
            } catch let error {
                print("JSON parsing error: \(error)")
            }
        }
        task.resume()
    }

    func navigateToHome() {
        // Check if HomeViewController is initialized correctly
        let homeVC = HomeViewController() // Ensure this is correctly set up

        // Push to navigation stack
        if let navigationController = navigationController {
            navigationController.pushViewController(homeVC, animated: true)
        } else {
            print("Navigation Controller is missing")
        }
    }

    func showLoginError() {
        let alert = UIAlertController(title: "Login Failed", message: "Invalid username or password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
