//
//  mainfetchviewViewController.swift
//  UCLhackTravelFun
//
//  Created by Landon Vago-Hughes on 28/10/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import TwitterKit

class mainfetchviewViewController: UIViewController {
    
    @IBOutlet weak var datatableview: UITableView!
    var tweetarray: [TWTRTweetView] = []
    var photoarray: [String] = []
    var state: Bool = false
    var bigarr: [[Int: AnyObject]] = []
    var senderreceiver: SenderObject!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.datatableview.dataSource = self
        if let post = senderreceiver {
            let dictinstance = [0: post.tweetview]
            bigarr.append(dictinstance as [Int : AnyObject])
            photoarray = post.urlimageviewarray
            var c = 1
            for i in photoarray {
                let dictinstance2 = [c: i]
                bigarr.append(dictinstance2 as [Int : AnyObject])
                c += 1
            }
        }
        
        print(bigarr)
        
        prepcell2()
        prepcell()
    }
    
    func prepcell() {
        let nib = UINib(nibName: "tweetcell", bundle: nil)
        datatableview.register(nib, forCellReuseIdentifier: "tweet")
    }

    func prepcell2() {
        let nib = UINib(nibName: "destinationimagenib", bundle: nil)
        datatableview.register(nib, forCellReuseIdentifier: "randomimage")
    }
}

extension mainfetchviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bigarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tag = 1
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tweet", for: indexPath) as? dataCellTableViewCell else { return UITableViewCell() }
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "randomimage", for: indexPath) as? destinationImageTableViewCell else { return UITableViewCell() }
        
        let imagecells = bigarr[indexPath.row]
        for (key, value) in imagecells {
            if key > 0 {
                cell2.configureDestinationImageView(imageURL: value as! String)
            } else {
                cell.configureCell(data: value as! TWTRTweetView)
                tag = 2
            }
        }
        if tag == 1 {
            return cell2
        }
        else {
            return cell
        }
    }
}
