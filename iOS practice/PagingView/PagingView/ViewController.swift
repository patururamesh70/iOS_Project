//
//  ViewController.swift
//  PagingView
//
//  Created by patururamesh on 20/07/24.
//

import UIKit
import LZViewPager

class ViewController: BaseViewController, LZViewPagerDelegate, LZViewPagerDataSource {
    
    @IBOutlet weak var viewPager: LZViewPager!
    
    private var subControllers:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPager.dataSource = self
        viewPager.delegate = self
       // viewPager.hostController = self
        let vc1 = UIViewController.createFromNib(storyBoardId: "ViewController")!
        vc1.title = "Title1"
        let vc2 = UIViewController.createFromNib(storyBoardId: "SecondViewController")!
        vc2.title = "Title2"
        let vc3 = UIViewController.createFromNib(storyBoardId: "ThirdViewController")!
        vc3.title = "Title3"
        let vc4 = UIViewController.createFromNib(storyBoardId: "FourthViewController")!
        vc4.title = "Title4"
        subControllers = [vc1, vc2, vc3, vc4]
        viewPager.reload()
        
        func numberOfItems() -> Int {
              return self.subControllers.count
          }
          
          func controller(at index: Int) -> UIViewController {
              return subControllers[index]
          }
          
          func button(at index: Int) -> UIButton {
              //Customize your button styles here
              let button = UIButton()
              button.setTitleColor(UIColor.black, for: .normal)
              button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
              return button
          }
    }
    
}
