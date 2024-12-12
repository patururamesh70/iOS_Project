//
//  ApiViewController.swift
//  API integrations
//
//  Created by patururamesh on 06/11/24.
//

import UIKit

class ApiViewController: UIViewController {

    let parser = Parser()
    override func viewDidLoad() {
        super.viewDidLoad()

        parser.parse()
    }
    

}
