//
//  ViewController.swift
//  collectionview3
//
//  Created by patururamesh on 27/07/24.
//

import UIKit

class ViewController: UIViewController {
      
    @IBOutlet weak var collection: UICollectionView!
    var images = ["Car1","Car2","Car3"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collection.collectionViewLayout = UICollectionViewFlowLayout()
    }
   
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewcontrollerCollectionViewCell
        cell.imageview.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width, height: collectionView.frame.height)
    }
}
