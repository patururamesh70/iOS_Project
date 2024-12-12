//
//  fiveViewController.swift
//  closures
//
//  Created by patururamesh on 09/08/24.
//

import UIKit

class fiveViewController: UIViewController {

    @IBOutlet weak var btnSubmit: UIButton!
 
    var isBtnTitleChanged = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func clickonButton(){
            if isBtnTitleChanged == false{
                btnSubmit.setTitle("Cancel", for: .normal)
                isBtnTitleChanged = true
            } else 
            {
                btnSubmit.setTitle("Submit", for: .normal)
                isBtnTitleChanged = false
            }
          }
        }
        
    

