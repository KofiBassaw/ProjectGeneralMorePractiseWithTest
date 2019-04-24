//
//  DatabaseManager.swift
//  ProjectGeneralMorePractiseWithTest
//
//  Created by Mathias Bassaw on 23/04/2019.
//  Copyright © 2019 Mathias Bassaw. All rights reserved.
//

import Foundation
import FMDB

let sharedInstance = DatabaseManager()
class DatabaseManager {

    var database: FMDatabase?
    
    class func getInstance() -> DatabaseManager
    {
        
        if sharedInstance.database == nil{
            sharedInstance.database = FMDatabase(path: Util.getPath(name: "Student.db"))
        }
        
        return sharedInstance
    }
    
    
    func createTable() -> Bool
    {
        sharedInstance.database?.open()
        
        
        let query = "CREATE TABLE IF NOT EXISTS student_info(RollNo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Name TEXT NOT NULL, Marks NUMERIC NOT NULL)";
        
        let result = try sharedInstance.database!.executeUpdate(query, withArgumentsIn: [])
        
        
        sharedInstance.database?.close()
        
        
       return result
    }
    
    
    func addStudent(student: Student) -> Bool
    {
        sharedInstance.database?.open()
        let query = "INSERT INTO student_info(NAME, Marks) VALUES(?,?)"
        
        let result = sharedInstance.database!.executeUpdate(query, withArgumentsIn: [student.Name, student.Marks])
        
        sharedInstance.database?.close()
        
        return result
        
    }
    
    func updateStudent(student: Student) -> Bool{
        sharedInstance.database?.open()
        
        let query = "UPDATE student_info SET Name = ?, Marks = ? WHERE RollNo = ?";
        
        let result = sharedInstance.database!.executeUpdate(query, withArgumentsIn: [student.Name, student.Marks, student.RollNo])
        sharedInstance.database?.close()
        return result
    }
    

    func getAllStudent()->[Student]?
    {
        sharedInstance.database?.open()
        
        let query = "SELECT * FROM student_info"
        
        do{
            let result: FMResultSet = try sharedInstance.database!.executeQuery(query, values: nil)
            
            var students: [Student] = []
            
            while result.next(){
                let name: String = result.string(forColumn: "Name")!
                let rollNo: Int = Int(result.int(forColumn: "RollNo"))
                let mark: Double = result.double(forColumn: "Marks")
                let stu: Student = Student(Name: name, Marks: mark, RollNo: rollNo)
                
                students.append(stu)
            }
            
            return students
        }catch{}
        sharedInstance.database?.close()
        
        return nil
    }
    
    
    
}
