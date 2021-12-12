//
//  ImageViewController.swift
//  landMarkBookAppLast
//
//  Created by Ali on 20.11.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
      
    var selectedlandMarkName = ""
    var selecetedLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedlandMarkName
        imageView.image = selecetedLandMarkImage
        
        
    }
    

}
