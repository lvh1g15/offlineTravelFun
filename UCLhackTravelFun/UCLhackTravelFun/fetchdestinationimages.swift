//
//  fetchdestinationimages.swift
//  UCLhackTravelFun
//
//  Created by Landon Vago-Hughes on 29/10/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import Foundation
import Alamofire

class FetchDestinationImages {
    
    let destination: String!
    let serverURL: URL?
    
    init(destination: String) {
        self.destination = destination
        self.serverURL = URL(string: "https://pixabay.com/api/?key=6860114-5b45c2b37b715a2762f69dd16&q=\(destination)&image_type=photo&pretty=true")
    }
    
    struct ReturnDestinationImageURLs {
        let wholeObject: [String: AnyObject]?
        init(wholeobject: [String: AnyObject]){
            self.wholeObject = wholeobject
        }
    }
    
    func alamoFetch(completion: @escaping(ReturnDestinationImageURLs) -> Void) {
        Alamofire.request(serverURL!, method: .get).response(completionHandler: { response in
            do {
                let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String : AnyObject]
                
                let returnStruct = ReturnDestinationImageURLs(wholeobject: json!)
                
                completion(returnStruct)

            } catch {
                print(response.error as NSError? ?? "")
            }
        })
    }
}

