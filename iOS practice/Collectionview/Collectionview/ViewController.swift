//
//  ViewController.swift
//  Collectionview
//
//  Created by patururamesh on 19/07/24.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var collectionview : UICollectionView!
    
    var images: [String] = ["Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo",]
    
    var names: [String] = ["Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo","Ntr","Ramesh.photo","Ramesh.photo",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionview.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return names.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 2
            cell.layer.borderColor = UIColor.red.cgColor
            cell.label.text = names[indexPath.row]

            cell.imageview.image = UIImage(named: images[indexPath.row])
            return cell
            
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = (collectionview.frame.size.width-10)/2
            return CGSize(width: size, height: size)
            
//            let screenSize: CGRect = UIScreen.main.bounds
//            return CGSize(width: screenSize.width/3 - 10 , height:180 )
        }
        
    }

