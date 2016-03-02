//
//  Extensions.swift
//  Restaurants
//
//  Created by Jim Liu on 3/2/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageWithUrl(urlString:String, contentMode mode: UIViewContentMode) {
        guard
            let url = NSURL(string: urlString)
            else { return }
        
        contentMode = mode
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                let data = data where error == nil,
                let image = UIImage(data: data)
                else { return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
            }
        }).resume()
    }
}