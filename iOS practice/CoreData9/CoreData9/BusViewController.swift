//
//  BusViewController.swift
//  CoreData9
//
//  Created by patururamesh on 23/09/24.
//

import UIKit

class BusViewController: UIViewController {
    
    @IBOutlet weak var BusNumberTF: UITextField!
    @IBOutlet weak var BusNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func save(){
        
    }
    @IBAction func clear() {
        BusNameTF.text = ""
        
    }
   
}
