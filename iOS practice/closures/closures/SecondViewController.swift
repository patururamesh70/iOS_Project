//
//  SecondViewController.swift
//  closures
//
//  Created by patururamesh on 08/08/24.
//

import UIKit           //Trailing Closure

class SecondViewController: UIViewController {
    
    func perfromSomething(a: Int, b : Int, myClosure: (Int,Int)->()) {
        
        print(a * b)
        myClosure(12,3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perfromSomething(a: 10, b: 20) { n1,n2 in
            print("This is MY Trailing closure")
            print(n1+n2)
        }
    }
}
