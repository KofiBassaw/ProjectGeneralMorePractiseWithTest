//
//  UtilTest.swift
//  UtilTest
//
//  Created by Mathias Bassaw on 23/04/2019.
//  Copyright © 2019 Mathias Bassaw. All rights reserved.
//

import XCTest
@testable import ProjectGeneralMorePractiseWithTest


class UtilTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetPath() {
        let path: String  = Util.getPath(name: "sample.text")
        
        
        XCTAssertNotNil(path,"Path is nil")
        XCTAssertNotEqual(path, "", "path failed to retrieve")
    }
    
    
    func testCopyFile()
    {
        let result: Bool = Util.copyFile(fileName: "Student.db")
        
        XCTAssertTrue(result,"file failed to save")
    }
    

 
    func testSaveString()
    {
        let res = Util.saveStringToFile(fileName: "testData", data: "sample data to save here")
        
        XCTAssertTrue(res)
    }
    
    func testGetSavedString()
    {
        let data = Util.getTextFromFile(fileName: "testData")
        XCTAssertEqual(data, "sample data to save here", "unable to retrieve string")
        
    }
    
    
    func testImageRequest()
    {
        let req = Util.generateImageRequest(url: "http://res.cloudinary.com/nardmoreimg/image/upload/v1528474526/vgprbwo4n6caapvthdqi.png")
        
        XCTAssertNotNil(req,"Image request is nil")
    }
    
    
    
    func testAlertController()
    {
        let alert = Util.generateAlertController(title: "test controller", message: "Sample Message", comment: "Sample comment")
        
        XCTAssertNotNil(alert,"Unable to generate alert")
        XCTAssertEqual(alert.title, "test controller", "Alert generated with error title")
    }
    

}
