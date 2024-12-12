//
//  ViewController.swift
//  practice
//
//  Created by patururamesh on 24/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1 : UILabel!
    @IBOutlet weak var label2 : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func clickOnMove() {
        let VC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        VC.delegate = self
        navigationController?.pushViewController(VC, animated: true)
    }
    

}
extension ViewController : DataBack {
    func passData(data: String, data1: String) {
        label1.text = data
        label2.text = data1
    }
    
}
