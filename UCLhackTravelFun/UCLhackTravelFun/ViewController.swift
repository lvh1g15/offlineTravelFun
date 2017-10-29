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
import Alamofire

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
        
        struct SenderObject {
            var urlimagearray: [String]!
            var tweetview: TWTRTweetView!
        }
        
        let client = TWTRAPIClient()
        client.loadTweet(withID: "1345") { (tweet, error) in
            if let t = tweet {
                let tweetView = TWTRTweetView(tweet: t)
                let imagefetchobject = FetchDestinationImages(destination: textField.text!)
                
                imagefetchobject.alamoFetch(completion: { response in
                    print(response)
                    
                    let senderObjectInstance = SenderObject.init(urlimagearray: response.imageURLArray!, tweetview: tweetView)
                    
                    self.loadinganime.stopAnimating()
                    self.performSegue(withIdentifier: "tomainview", sender: senderObjectInstance)

                })
                
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

