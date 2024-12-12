//
//  ViewController.swift
//  closures
//
//  Created by patururamesh on 08/08/24.
//

import UIKit               // closure

class ViewController: UIViewController {

    var Myclosure: (Int,Int) ->(Int,Int) = { a,b in                       //closure -> type annotation
            print("Hi")
            print(a * b)
            return (a * b, a-b)
      }
    
    
    var closure = { (a:Int, b: Int) -> (Int,Int) in                 // closure -> without type annotation
        
           return (a + b, a-b)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     let result = closure(2,5)
        print(result)
        
     let result1 = Myclosure(5,5)
        print(result1)
    }
}

