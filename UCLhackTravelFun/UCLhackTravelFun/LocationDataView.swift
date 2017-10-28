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

        view.addSubview(getcontentbut)

        getcontentbut.snp.makeConstraints({(makes) -> Void in
            makes.centerX.equalToSuperview()
            makes.centerY.equalToSuperview().inset(view.layer.frame.height*0.2)
            makes.width.equalTo(view.layer.frame.width*0.4)
            makes.height.equalTo(view.layer.frame.height*0.06)
        })
        
        getcontentbut.backgroundColor = UIColor.white
        getcontentbut.setTitleColor(UIColor(red: 34/255, green: 58/255, blue: 70/255, alpha: 1.0), for: .normal)
        getcontentbut.setAttributedTitle(NSAttributedString(string: "Load", attributes: [NSFontAttributeName: UIFont(name: "Avenir-Black", size: 25.0)!]), for: .normal)
        getcontentbut.layer.cornerRadius = 15.0
        
        return getcontentbut
    }
}
