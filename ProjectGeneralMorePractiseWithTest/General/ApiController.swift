//
//  ApiController.swift
//  ProjectGeneralMorePractiseWithTest
//
//  Created by Mathias Bassaw on 23/04/2019.
//  Copyright © 2019 Mathias Bassaw. All rights reserved.
//

import Foundation

protocol Apicontroller{
    func didReceieveResult(data: Data, type: Int)
    func didReceieveError(message: String, type: Int)
    
}
