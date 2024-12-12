//
//  ViewController.swift
//  Protocal and delegate
//
//  Created by patururamesh on 06/11/24.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var label1 : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func SecondVc(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        VC.delegate = self
        navigationController?.pushViewController(VC, animated: true)
    }
    
}
extension ViewController: DataBack
{
    func passData(data: String, data1: String) {
        Label.text = data
        label1.text = data1
        
    }
}

