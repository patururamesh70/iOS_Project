//
//  FourthViewController.swift
//  closures
//
//  Created by patururamesh on 08/08/24.
//

import UIKit

class FourthViewController: UIViewController {

    let age: Int = 10
    let myClosure: () -> () = {          // closure
        print("I am a closure")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myClosure()
        
        let result1 = add(3, 5)     //Basic closure
        print(result1)
        
        let result2 = performOperation(3, 5) { (a, b) in    // trailing closure
            return a + b
        }
        print(result2)
        
        someFunctionWithEscapingClosure {                   // Escaping Closures
            print("This is an escaping closure")
        }

        someFunctionWithNonEscapingClosure {
            print("This is a non-escaping closure")
        }
    }
    
    
    let add: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in     // Basic closure sum
        return a + b
    }
    
    func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {  // trailing closure
        return operation(a, b)       //If you need to pass a closure as the last argument to a function and the closure is long, you can write it as a trailing closure outside the parentheses.
    }
    var completionHandlers: [() -> Void] = []          //Escaping Closures

    func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }

    func someFunctionWithNonEscapingClosure(closure: () -> Void) {    // A closure is said to escape a function when the closure is passed as an argument to the function but is called after the function returns. You indicate that a closure can escape by writing @escaping before the parameter’s type.
        closure()
    }
    
}



