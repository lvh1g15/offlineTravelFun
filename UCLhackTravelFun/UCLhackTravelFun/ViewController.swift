//
//  ViewController.swift
//  UCLhackTravelFun
//
//  Created by Landon Vago-Hughes on 28/10/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gifearth: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let locationsetup = Locationfetch(superview: self.view)
        locationsetup.getcontentbut?.addTarget(self, action: #selector(tomainfeed(_:)), for: .touchUpInside)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tomainfeed(_ sender: UIButton) {
        // set label title
    }
}

