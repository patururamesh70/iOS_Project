//
//  ThirdViewController.swift
//  closures
//
//  Created by patururamesh on 08/08/24.
//

import UIKit           //Escaping Vs Non-Escaping Closure

class ThirdViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               nonEscapingClosure { (str) in       // Non-escaping closure
                    print(str)
                }
                print("Closure Next Line")
                }
//            escapingClosure { (str) in                     // escaping closure
//              print(str)
//          }
//           print("Closure Next Line")
//      }
//
    private func nonEscapingClosure(completion: (String) -> Void) {     // Non-escaping closure
        print("Closure Start")
        completion("Closure called")
        print("Closure end")
    }
    private func escapingClosure(completion: @escaping(String) -> Void) {        // escaping closure
        print("Closure Start")
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
            completion("Closure called")
        }
        print("Closure end")
    }
}
