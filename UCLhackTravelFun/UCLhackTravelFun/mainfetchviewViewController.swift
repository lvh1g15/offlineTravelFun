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
    
    var data: TWTRTweetView?
    @IBOutlet weak var datatableview: UITableView!
    var dataarray: [TWTRTweetView]!
    
    let segueobject = {
        ["destination": String(), "tweets": TWTRTweetView()]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepcell()
        dataarray.append(data!)
    }
    
    func prepcell() {
        let nib = UINib(nibName: "tweetcell", bundle: nil)
        datatableview.register(nib, forCellReuseIdentifier: "event")
    }
}

extension mainfetchviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "event", for: indexPath) as? dataCellTableViewCell else { return UITableViewCell() }
        let cells = dataarray[indexPath.row]
        cell.configureCell(data: cells)
        return cell
    }
}
