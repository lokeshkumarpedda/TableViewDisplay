//
//  Services.swift
//  TableViewDisplay
//
//  Created by Next on 22/12/16.
//  Copyright © 2016 Next. All rights reserved.
//

import UIKit
import Alamofire

class Services: NSObject
{
    
    //for getting the data
    class func getData(callback: @escaping (_ Result : [[String : Any]]) -> Void)
    {
        Alamofire.request("http://www.androidbegin.com/tutorial/jsonparsetutorial.txt").responseJSON
            { response in
            if let JSON = response.result.value {
                let response = JSON as! [String : AnyObject]
                let dataArray = response["worldpopulation"] as! [[String : Any]]
                callback(dataArray)
            }
        }
       
    }
    
    
    //for getting images
    class func getImage(url: String ,callback: @escaping (_ Result : UIImage) -> Void)
    {
        Alamofire.request(url).responseData { response in
            if let data = response.result.value{
                let image = UIImage(data: data)
                callback(image!)
            }
        }
    }
}
