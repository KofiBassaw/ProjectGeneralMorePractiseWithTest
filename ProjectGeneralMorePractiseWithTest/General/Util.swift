//
//  Util.swift
//  ProjectGeneralMorePractiseWithTest
//
//  Created by Mathias Bassaw on 23/04/2019.
//  Copyright © 2019 Mathias Bassaw. All rights reserved.
//

import Foundation
import UIKit
import Nuke


class Util
{
    class func getPath(name: String) -> String
    {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let docPath = path!.appendingPathComponent(name)
        return docPath.path
    }
    
    class func copyFile(fileName: String) -> Bool
    {
        let path = getPath(name: fileName)
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: path)
        {
            let bundlePath = Bundle.main.resourceURL
            
            let fromPath = bundlePath?.appendingPathComponent(fileName)
            
            do{
                try fileManager.copyItem(atPath: fromPath!.path, toPath: path)
                return true
                
            }catch let error as NSError{
                print(error.localizedDescription)
            }
            
        }else{
            return true
        }
    
           return false
    }
    
    
    class func generateAlertView(message: String, title: String, delegate: AnyObject){
        var alert: UIAlertView = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    
    
    class func saveStringToFile(fileName: String, data: String) -> Bool
    {
        let fileWithExt = "\(fileName).txt"
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let docUrl = dir!.appendingPathComponent(fileWithExt)
        do{
            try data.write(to: docUrl, atomically: true, encoding: .utf8)
            return true
        }catch{}
        
        return false
    }
    
    class func getTextFromFile(fileName: String) -> String{
         let fileWithExt = "\(fileName).txt"
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let docUrl = dir!.appendingPathComponent(fileWithExt)
        
        do{
            let data = try String(contentsOf: docUrl)
            return data
        }catch{}
        
        return ""
    }
    
    class func generateImageRequest(url:String) -> ImageRequest{
        let urlObj = URL(string: url)!
        let urlReq = URLRequest(url: urlObj, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 50)
        var imageReq = ImageRequest(urlRequest: urlReq)
        imageReq.memoryCacheOptions.isReadAllowed = true
        imageReq.memoryCacheOptions.isWriteAllowed = true
        
        
        return imageReq
        
        
    }
    
    class func generateAlertController(title: String, message:String, comment: String) -> UIAlertController
    {
        let alert = UIAlertController(title: NSLocalizedString(title, comment: comment), message: message, preferredStyle: .alert)
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityIndicator.frame = activityIndicator.frame.offsetBy(dx: 8, dy: (alert.view.bounds.height - activityIndicator.frame.height)/2);
        activityIndicator.autoresizingMask = [.flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        //activityIndicator.color = UIColo
        activityIndicator.startAnimating();
        alert.view.addSubview(activityIndicator);
        
  
        return alert
        
        
        
    }
    
}
