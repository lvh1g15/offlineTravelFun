//
//  destinationImageTableViewCell.swift
//  UCLhackTravelFun
//
//  Created by Landon Vago-Hughes on 29/10/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import Kingfisher

class destinationImageTableViewCell: UITableViewCell {

    @IBOutlet weak var destinationimageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureDestinationImageView(imageURL: String) {
        let url = URL(string: imageURL)
        destinationimageview.kf.setImage(with: url)
    }
}
