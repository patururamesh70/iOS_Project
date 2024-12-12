//
//  SecondViewController.swift
//  Notificationcenter
//
//  Created by patururamesh on 15/08/24.
//

import UIKit

class SecondViewController: UIViewController {

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
      @IBAction func clickOnThirdViewcontroller(){
          let SVC = storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController
          navigationController?.pushViewController(SVC!, animated: true)
      }
}
