//
//  ThirdViewController.swift
//  Notificationcenter
//
//  Created by patururamesh on 15/08/24.
//
import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    NotificationCenter.default.addObserver(self, selector: #selector(themeChanged), name: themeChangeNotification, object: nil)
    }
    
    @objc func themeChanged(notification: Notification) {
        print(notification.userInfo)
        print("Notification Triggered")
        
        if let themeColor = notification.userInfo?.values.first as? UIColor {
            view.backgroundColor = themeColor
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: themeChangeNotification, object: nil)
    }
    
    @IBAction func clickOnSettingViewcontroller() {
        if let SVC = storyboard?.instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController {
            navigationController?.pushViewController(SVC, animated: true)
        }
    }
}
