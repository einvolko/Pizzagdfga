//
//  MainMenuCell.swift
//  MyPizzaApp
//
//  Created by Михаил Супрун on 24.02.2024.
//

import UIKit

class MainMenuCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var descriptField: UITextView!
    
    @IBOutlet weak var cost: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.layer.cornerRadius = cornerRadius
    }

}
