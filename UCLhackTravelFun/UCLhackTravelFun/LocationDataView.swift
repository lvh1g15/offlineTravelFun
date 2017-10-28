//
//  LocationDataLoadButton.swift
//  UCLhackTravelFun
//
//  Created by Landon Vago-Hughes on 28/10/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class Locationfetch {
    
    var superview: UIView
    var getcontentbut: UIButton?
    
    init(superview: UIView) {
        self.superview = superview
        let getcontent = frontpageview(view: self.superview)
        self.getcontentbut = getcontent
    }
    
    func frontpageview(view: UIView) -> UIButton {

        let getcontentbut = UIButton()
        self.getcontentbut = getcontentbut

        superview.addSubview(getcontentbut)

        getcontentbut.snp.makeConstraints({(makes) -> Void in
            makes.centerX.equalToSuperview()
            makes.centerY.equalToSuperview().inset(-superview.layer.frame.height*0.2)
            makes.width.equalTo(superview.layer.frame.width*0.4)
            makes.height.equalTo(superview.layer.frame.height*0.2)
        })
        
        getcontentbut.backgroundColor = UIColor.white
        getcontentbut.setAttributedTitle(NSAttributedString(string: "Load", attributes: [NSFontAttributeName: UIFont(name: "Myriad", size: 15.0)!, NSBackgroundColorAttributeName: UIColor(red: 34/255, green: 58/255, blue: 70/255, alpha: 1.0)]), for: .normal)
        getcontentbut.layer.cornerRadius = 5.0
        
        return getcontentbut
    }
}
