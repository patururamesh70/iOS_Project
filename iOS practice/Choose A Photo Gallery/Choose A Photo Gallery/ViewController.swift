//
//  ViewController.swift
//  Choose A Photo Gallery
//
//  Created by patururamesh on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image.layer.borderWidth = 1
        self.image.layer.borderColor = UIColor.black.cgColor
        self.image.layer.masksToBounds = false
        self.image.layer.cornerRadius = image.frame.size.height/2
        self.image.clipsToBounds = true
        tapgasture()
    }
    func tapgasture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tap)
    }
    @objc func imageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }

}
extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
                               info: [UIImagePickerController.InfoKey : Any]) {
        image.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
     
    
}

