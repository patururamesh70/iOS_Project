//
//  ViewController.swift
//  CoreAnimation
//
//  Created by patururamesh on 17/09/24.
//

import UIKit

class ViewController: UIViewController {
    let layer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        layer.backgroundColor = UIColor.orange.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateMovement(direction: "right")
            self.animateOpacity()
        }
    }
    func animateMovement(direction: String) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.midX, y: layer.frame.midY)
        switch direction {
        case "right":
            animation.toValue = CGPoint(x: layer.frame.midX + 200, y: layer.frame.midY)
        case "left":
            animation.toValue = CGPoint(x: layer.frame.midX - 200, y: layer.frame.midY)
        case "top":
            animation.toValue = CGPoint(x: layer.frame.midX, y: layer.frame.midY - 200)
        case "bottom":
            animation.toValue = CGPoint(x: layer.frame.midX, y: layer.frame.midY + 500)
        default:
            break
        }
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        layer.add(animation, forKey: nil)
    }
    func animateOpacity() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        layer.add(animation, forKey: nil)
    }
}
