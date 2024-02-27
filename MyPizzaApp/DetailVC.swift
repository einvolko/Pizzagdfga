//
//  DetailVC.swift
//  MyPizzaApp
//
//  Created by Михаил Супрун on 24.02.2024.
//

import UIKit

class DetailVC: UIViewController {
    
   lazy var rightSwipeGesture = {
       let gesture = UISwipeGestureRecognizer()
       gesture.direction = .right
       gesture.addTarget(self, action: #selector(self.didRightSwipe))
       return gesture
   }

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var button: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(rightSwipeGesture())
    
    }
    @objc func didRightSwipe () {
        dismiss(animated: true)
    }
    
    @IBAction func addAction(_ sender: Any) {
        
    }
}

