//
//  ViewController.swift
//  Button
//
//  Created by patururamesh on 19/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSubmit: UIButton!
    
    var isBtnTitleChanged = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
       @IBAction func ClickOnSubmitbutton(_ sender: UIButton) {
           if isBtnTitleChanged == false{
               btnSubmit.setTitle("Cancel", for: .normal)
               isBtnTitleChanged = true
           }else{
               btnSubmit.setTitle("Submit", for: .normal)
               isBtnTitleChanged = false
           }
    }
}

