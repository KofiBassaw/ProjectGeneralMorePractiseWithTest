//
//  DatabaseTest.swift
//  DatabaseTest
//
//  Created by Mathias Bassaw on 23/04/2019.
//  Copyright © 2019 Mathias Bassaw. All rights reserved.
//

import XCTest
@testable import ProjectGeneralMorePractiseWithTest

class DatabaseTest: XCTestCase {

    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
    func testCreateTable()
    {
        let result = DatabaseManager.getInstance().createTable()
        
        XCTAssertTrue(result,"Unable to create table")
    }
    
    func testAddStudent()
    {
        let studentOneStu: Student = Student(Name: "Aba Esuon", Marks: (0.5), RollNo: 0)
    
        let result = DatabaseManager.getInstance().addStudent(student: studentOneStu)
        XCTAssertTrue(result,"Failed to add student")
    }
    
    
    func testgetAllStudent(){
        let result = DatabaseManager.getInstance().getAllStudent()!
        
        XCTAssertNotNil(result,"Failed to retrieve student")
        
       // XCTAssertGreaterThan(result?.count, 0,"No Student retrieved")
        
        let oneStudent: Student = result[0]
        
       XCTAssertEqual(oneStudent.RollNo, 1, "Invalid student")
      
    }

    func testUpdateStudent()
    {
           let studentOneStu: Student = Student(Name: "Aba Esuon 2", Marks: (0.5), RollNo: 1)
   
        let result = DatabaseManager.getInstance().updateStudent(student: studentOneStu)
        
        XCTAssertTrue(result,"Failed to update student")
    
    }
 

}
