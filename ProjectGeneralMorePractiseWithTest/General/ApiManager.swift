//
//  ApiManager.swift
//  ProjectGeneralMorePractiseWithTest
//
//  Created by Mathias Bassaw on 23/04/2019.
//  Copyright © 2019 Mathias Bassaw. All rights reserved.
//

import Foundation
import Alamofire

let shareApiManager = ApiManager()
class ApiManager{
    
    var delegate: Apicontroller?
    class func getInstance(delegate: Apicontroller) -> ApiManager
    {
        if shareApiManager.delegate == nil
        {
            shareApiManager.delegate = delegate
        }
        return shareApiManager
    }
    
    
    func makeRequest(url: String, method: HTTPMethod, type: Int, parameters:[String:AnyObject], header: [String:String],  res: @escaping () -> Void){
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: header).responseData{ result in
            
            if let status = result.response?.statusCode
            {
                if status == 200
                {
                    if let data = result.data{
                        
                        let resultString = String(data: data, encoding: .utf8)!
                        print("result here: \(resultString)")
                        shareApiManager.delegate?.didReceieveResult(data: data, type: type)
                    }else{
                            shareApiManager.delegate?.didReceieveError(message: "Invalid response", type: type)
                    }
                    
                    
                    
                }else{
                    shareApiManager.delegate?.didReceieveError(message: "Invalid request", type: type)
                }
                
            }else{
                shareApiManager.delegate?.didReceieveError(message: "Invalid request", type: type)
            }
        }
    }
}
