//
//  SecondViewController.swift
//  practice
//
//  Created by patururamesh on 24/10/24.
//

import UIKit

protocol DataBack {
    func passData(data: String , data1: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textfield : UITextField!
    @IBOutlet weak var textfield1 : UITextField!
    var delegate: DataBack!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func ClickOnBack(_ sender: Any){
        delegate.passData(data: textfield.text!, data1: textfield1.text!)
        navigationController?.popViewController(animated: true)
        
    }
    
}
