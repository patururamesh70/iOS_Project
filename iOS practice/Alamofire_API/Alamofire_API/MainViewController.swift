//
//  MainViewController.swift
//  Alamofire_API
//
//  Created by patururamesh on 04/11/24.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to the App!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .center
        welcomeLabel.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 50)
        
        view.addSubview(welcomeLabel)
    }
}
