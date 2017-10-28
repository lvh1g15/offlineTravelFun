//
//  ViewController.swift
//  UCLhackTravelFun
//
//  Created by Landon Vago-Hughes on 28/10/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import TwitterKit

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
        
        let client = TWTRAPIClient()
        client.loadTweet(withID: "20") { (tweet, error) in
            if let t = tweet {
                let tweetView = TWTRTweetView(tweet: t)
                self.performSegue(withIdentifier: "tomainview", sender: tweetView)
            } else {
                print("Failed to load Tweet: \(error?.localizedDescription ?? "")")
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tomainview" {
            (segue.destination as! mainfetchviewViewController).data = sender as? TWTRTweetView

        }
    }
}

