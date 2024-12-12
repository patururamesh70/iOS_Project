//
//  SecondViewController.swift
//  Protocal and delegate
//
//  Created by patururamesh on 06/11/24.
//

import UIKit

protocol DataBack {
    func passData(data:String,data1:String)
    
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textfiled: UITextField!
    @IBOutlet weak var textfield1: UITextField!
    var delegate:DataBack!

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func MovetofirstVC(_ sender: Any) {
        delegate.passData(data: textfiled.text!,data1: textfield1.text!)
        navigationController?.popViewController(animated: true)
    }
    
}
