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
    
    var senderreceiver: SenderObject!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.datatableview.dataSource = self
        if let post = senderreceiver {
            tweetarray.append(post.tweetview)
            photoarray = post.urlimageviewarray
            print(tweetarray, photoarray)
        }
//        prepcell()
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
        return photoarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tweet", for: indexPath) as? dataCellTableViewCell else { return UITableViewCell() }
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "randomimage", for: indexPath) as? destinationImageTableViewCell else { return UITableViewCell() }
        
        let imagecells = photoarray[indexPath.row]
        cell2.configureDestinationImageView(imageURL: imagecells)
        return cell2

//        let tweetcells = tweetarray[indexPath.row]
//        cell.configureCell(data: tweetcells)
//        return cell
    }
}
