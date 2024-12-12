//
//  AddcarViewController.swift
//  CoreData2
//
//  Created by patururamesh on 16/09/24.
//

import UIKit
import CoreData

class AddcarViewController: UIViewController {
    
    @IBOutlet weak var brandTF: UITextField!
    @IBOutlet weak var colourTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func save() {
        let brand: String = brandTF.text!
        let colour: String = colourTF.text!
        
        guard let car = NSManagedObject(entity: Car.entity(),insertInto: CoreDataManager.shared.context) as? Car else {
            return
        }
        car.brand = brand
        car.colour = colour
        CoreDataManager.shared.saveContext()
    }
    @IBAction func clear() {
        brandTF.text = ""
        colourTF.text = ""
    }


}
