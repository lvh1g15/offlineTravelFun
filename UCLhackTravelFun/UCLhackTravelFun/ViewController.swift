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
import Kingfisher
import Gifu
import AVKit
import MediaPlayer

class SenderObject {
    var urlimageviewarray: [String]!
    var tweetview: TWTRTweetView!
    init(urlimageviewarray: [String], tweetview: TWTRTweetView) {
        self.urlimageviewarray = urlimageviewarray
        self.tweetview = tweetview
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var earthview: UIImageView!
    private var loadinganime: NVActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let imageView = GIFImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.earthview = imageView
        view.addSubview(imageView)
        imageView.animate(withGIFNamed: "introscreenuclhack")
        imageView.prepareForAnimation(withGIFNamed: "introscreenuclhack")
        imageView.startAnimatingGIF()
        
        let locationsetup = Locationfetch(superview: self.view)
        locationsetup.traveltotext?.delegate = self
        self.loadinganime = locationsetup.loadingfeed
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        loadinganime.startAnimating()
        
        let client = TWTRAPIClient()
        client.loadTweet(withID: "1345") { (tweet, error) in
            if let t = tweet {
                let tweetView = TWTRTweetView(tweet: t)
                let imagefetchobject = FetchDestinationImages(destination: textField.text!)
                
                imagefetchobject.alamoFetch(completion: { response in

                    var urlimagearr: [String] = []
                    let responsearr = response.wholeObject?["hits"] as? [AnyObject] ?? []
                    for i in 0...15 {
                        let individualresponse = responsearr[i] as? [String: AnyObject] ?? [:]
                        urlimagearr.append(individualresponse["webformatURL"] as? String ?? "")
                        
                    }

                    let senderObjectInstance = SenderObject(urlimageviewarray: urlimagearr, tweetview: tweetView)
                    
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
            (segue.destination as! mainfetchviewViewController).senderreceiver = sender as! SenderObject
        }
    }
}

extension UIImageView: GIFAnimatable {
    private struct AssociatedKeys {
        static var AnimatorKey = "gifu.animator.key"
    }
    
    override open func display(_ layer: CALayer) {
        updateImageIfNeeded()
    }
    
    public var animator: Animator? {
        get {
            guard let animator = objc_getAssociatedObject(self, &AssociatedKeys.AnimatorKey) as? Animator else {
                let animator = Animator(withDelegate: self)
                self.animator = animator
                return animator
            }
            
            return animator
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.AnimatorKey, newValue as Animator?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

