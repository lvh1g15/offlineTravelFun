//
//  ViewController.swift
//  UCLhackTravelFun
//
//  Created by Landon Vago-Hughes on 28/10/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var gifearth: UIImageView!
    private var loadinganime: NVActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let locationsetup = Locationfetch(superview: self.view)
        locationsetup.traveltotext?.delegate = self
        self.loadinganime = locationsetup.loadingfeed
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        loadinganime.startAnimating()
        
        return true
    }
}

