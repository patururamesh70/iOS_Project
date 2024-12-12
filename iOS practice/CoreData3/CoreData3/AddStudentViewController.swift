//
//  AddStudentViewController.swift
//  CoreData3
//
//  Created by patururamesh on 17/09/24.
//

import UIKit
import CoreData

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var AdressTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func Save(){
        let name: String = NameTF.text!
        let adress: String = AdressTF.text!
        
        guard let student = NSManagedObject(entity: Student.entity(), insertInto: CoreDataManger.shared.context) as? Student else {
            return
        }
        student.adress = adress
        student.name = name
        CoreDataManger.shared.saveContext()
        
    }
    @IBAction func Clear(){
        NameTF.text = ""
        AdressTF.text = ""
        
    }


}
