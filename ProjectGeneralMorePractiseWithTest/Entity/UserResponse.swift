//
//  UserResponse.swift
//  General Practise
//
//  Created by Mathias Bassaw on 21/04/2019.
//  Copyright © 2019 Mathias Bassaw. All rights reserved.
//

import Foundation

struct UserResponse: Codable
{
    var details: User
    var success: Int
    var message: String
}
