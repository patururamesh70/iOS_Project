//
//  AddViewController.swift
//  CoreData5
//
//  Created by patururamesh on 20/09/24.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    @IBOutlet weak var BrandTF: UITextField!
    @IBOutlet weak var ColorTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func Save(){
        let brand : String = BrandTF.text!
        let color : String = ColorTF.text!
        
        guard let car = NSManagedObject(entity: Car.entity(), insertInto: CoreDataManager.shared.context) as? Car else { return
        }
        car.brand = brand
        car.color = color
        
    }
    @IBAction func Clear(){
        BrandTF.text = ""
        ColorTF.text = ""
    }

    
}
