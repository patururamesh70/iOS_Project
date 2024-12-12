//
//  ViewController.swift
//  Protocal
//
//  Created by patururamesh on 06/11/24.
//
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myCar = Car(color: "Red")
        myCar.startEngine()
        print("My car has \(myCar.numberOfWheels) wheels and is \(myCar.color).")
        myCar.stopEngine()    
    }
}
