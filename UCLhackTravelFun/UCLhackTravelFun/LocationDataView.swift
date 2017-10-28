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
    var traveltotext: UITextField?
    
    init(superview: UIView) {
        self.superview = superview
        frontpageview(view: self.superview)
    }
    
    func frontpageview(view: UIView) {

        let getcontentbut = UIButton()
        self.getcontentbut = getcontentbut

        view.addSubview(getcontentbut)

        getcontentbut.snp.makeConstraints({(makes) -> Void in
            makes.centerX.equalToSuperview()
            makes.centerY.equalToSuperview().inset(view.layer.frame.height*0.2)
            makes.width.equalTo(view.layer.frame.width*0.50)
            makes.height.equalTo(view.layer.frame.height*0.1)
        })
        
        getcontentbut.backgroundColor = UIColor.white
        getcontentbut.setAttributedTitle(NSAttributedString(string: "Load", attributes: [NSFontAttributeName: UIFont(name: "Avenir-Black", size: 25.0)!, NSForegroundColorAttributeName : UIColor(red: 37/255, green: 67/255, blue: 80/255, alpha: 1.0)]), for: .normal)
        getcontentbut.layer.cornerRadius = 15.0
        getcontentbut.layer.opacity = 0.6
        
        let traveltotext = UITextField()
        self.traveltotext = traveltotext
        
        view.addSubview(traveltotext)
        
        traveltotext.snp.makeConstraints({(makes) -> Void in
            makes.centerX.equalToSuperview()
            makes.centerY.equalToSuperview().inset(-view.layer.frame.height*0.2)
            makes.width.equalTo(view.layer.frame.width*0.70)
            makes.height.equalTo(view.layer.frame.height*0.1)
        })
        
        traveltotext.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        traveltotext.textColor = UIColor(red: 37/255, green: 67/255, blue: 80/255, alpha: 1.0)
        traveltotext.attributedPlaceholder = NSAttributedString(string: "Destination", attributes: [NSFontAttributeName: UIFont(name: "Avenir-Black", size: 25.0)!, NSForegroundColorAttributeName : UIColor(red: 37/255, green: 67/255, blue: 80/255, alpha: 1.0)])
        traveltotext.textAlignment = .center
        traveltotext.font = UIFont(name: "Avenir-Black", size: 25.0)
        traveltotext.textColor = UIColor(red: 37/255, green: 67/255, blue: 80/255, alpha: 1.0)
        traveltotext.layer.cornerRadius = 35.0
        
    }
}
