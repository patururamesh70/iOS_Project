//
//  SettingsViewController.swift
//  Notificationcenter
//
//  Created by patururamesh on 15/08/24.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func changeTheme() {
        let r = Float.random(in: 0.0...255.0)
        let g = Float.random(in: 0.0...255.0)
        let b = Float.random(in: 0.0...255.0)
        
        let themeColor = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
        
        view.backgroundColor = themeColor
        
        let userInfo = ["Theme": themeColor]
        NotificationCenter.default.post(name: themeChangeNotification, object: nil ,userInfo: userInfo)
    }
}

