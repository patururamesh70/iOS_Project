//
//  ViewController.swift
//  Notificationcenter
//
//  Created by patururamesh on 15/08/24.
//

import UIKit

let themeChangeNotification = NSNotification.Name("ThemeChangedNotificaion")

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        NotificationCenter.default.addObserver(self, selector: #selector(themeChanged), name: themeChangeNotification, object: nil)
    }
    @objc func themeChanged(notification: Notification) {
        print(notification.userInfo)
        print("notification Triggered")
        
        if let color = notification.userInfo?.values.first, let themeColor = color as? UIColor {
            view.backgroundColor = themeColor
        }
        
    }
    @IBAction func clickOnSecondViewcontroller(){
        let SVC = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        navigationController?.pushViewController(SVC!, animated: true)
    }
}

