//
//  dataCellTableViewCell.swift
//  UCLhackTravelFun
//
//  Created by Landon Vago-Hughes on 29/10/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import TwitterKit

class dataCellTableViewCell: UITableViewCell {

    @IBOutlet weak var backview: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(data: TWTRTweetView) {
        self.backview.addSubview(data)
    }
}
