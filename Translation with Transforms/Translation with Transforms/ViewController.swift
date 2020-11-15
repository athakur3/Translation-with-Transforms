//
//  ViewController.swift
//  Translation with Transforms
//
//  Created by Akshansh Thakur on 15/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballView: BallView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.setupUI()
    }
}

class BallView: UIView {
    
    enum Direction {
        case up
        case down
        case right
        case left
        case middle
    }
    
    var currentDirection = Direction.middle
    
    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var rightKey: UIButton!
    @IBOutlet weak var leftKey: UIButton!
    @IBOutlet weak var bottomKey: UIButton!
    @IBOutlet weak var upKey: UIButton!
    
    func setupUI() {
        
        [rightKey, leftKey, upKey, bottomKey].forEach({$0?.addTarget(self, action: #selector(moveBall(_:)), for: .touchUpInside)})
        
    }
    
    @objc func moveBall(_ sender: UIButton) {
        
        switch sender {
        case rightKey:
            UIView.animate(withDuration: 0.5) {
                self.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width / 4.0, y: 0.0)
            }
        case leftKey:
            UIView.animate(withDuration: 0.5) {
                self.transform = CGAffineTransform(translationX: -(UIScreen.main.bounds.width / 4.0), y: 0.0)
            }
        case upKey:
            UIView.animate(withDuration: 0.5) {
                self.transform = CGAffineTransform(translationX: 0.0, y: -(UIScreen.main.bounds.height / 4.0))
            }
        case bottomKey:
            UIView.animate(withDuration: 0.5) {
                self.transform = CGAffineTransform(translationX: 0.0, y: UIScreen.main.bounds.height / 4.0)
            }
        default:
            print("Invalid")
            break
        }
        
        UIView.animate(withDuration: 1.0) {
            self.superview?.layoutIfNeeded()
        }
        
    }
    
}
