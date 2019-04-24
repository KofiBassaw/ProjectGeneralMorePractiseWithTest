//
//  ApiTest.swift
//  ApiTest
//
//  Created by Mathias Bassaw on 23/04/2019.
//  Copyright © 2019 Mathias Bassaw. All rights reserved.
//

import XCTest
@testable import ProjectGeneralMorePractiseWithTest
@testable import Alamofire


class MockApi: Apicontroller
{
    
    var message: String?
    var user: UserResponse?
    func didReceieveResult(data: Data, type: Int) {
        let decoder = JSONDecoder()
        
        //let stringData = Data(data.utf8)
        do{
            try user = decoder.decode(UserResponse.self, from: data)
        }catch{}
    }
    
    func didReceieveError(message: String, type: Int) {
        self.message = message
    }
    
 
}

class ApiTest: XCTestCase {
    
    private enum Constants{
        static let email: String = "email"
        static let password: String = "password"
        static let phoneNum: String = "contact"
        static let fullName: String = "fullname"
    }

    var moc: MockApi?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
          moc = MockApi()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        moc = nil
    }

  
    func testRegister()
    {
        var sentArr = [String:AnyObject]()
        
        
        sentArr[Constants.fullName] = "Aba" as AnyObject
        sentArr[Constants.email] = "sample@email.com" as AnyObject
        sentArr[Constants.password] = "password123456789" as AnyObject
        sentArr[Constants.phoneNum] = "0266504723" as AnyObject
        
         let exp = expectation(description: "registering users")
        
        ApiManager.getInstance(delegate: self.moc!).makeRequest(url: "http://34.239.122.97/nardmoreapi/users", method: HTTPMethod.post, type: 1, parameters:sentArr, header: [:]){
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 40)
        
        
        XCTAssertNil(moc?.message, moc!.message!)
        XCTAssertNotNil(moc?.user)
        XCTAssertEqual(moc?.user?.success, 0,moc!.user!.message)
        
        
        
        
    }

}
