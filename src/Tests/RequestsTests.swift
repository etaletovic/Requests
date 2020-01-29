//
//  Tests.swift
//  Tests
//
//  Created by Emir Taletovic on 1/20/20.
//  Copyright © 2020 Emir Taletovic. All rights reserved.
//

import XCTest
@testable import Requests

class RequestsTests: XCTestCase {
    
    let apiUrl = ""
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGet() {
        
        let url = URL(string: apiUrl)!
        
        let res = try? Requests.get(url: url).get()
        
        XCTAssert(res != nil)
    }
    
    func testPost() {
        
        let url = URL(string: apiUrl)!
        
        let member = Person (
            name: "Mujo",
            age: 25,
            children: [
                Person(name: "Stuka", age: 13, children: nil),
                Person(name: "Hanka", age: 30, children: nil)
            ]
        )
        
        let data: Data? = Serialization.encode(member)
        
        XCTAssert(data != nil)
        
        let res = try? Requests.post(url: url, body: data).get()
                
        let dd = Serialization.decode(Person.self, from: res!)
        
        XCTAssert(dd != nil)
    }
    
    func testPut() {
        
        let url = URL(string: apiUrl)!
        
        let member = Person (
            name: "Mujo",
            age: 25,
            children: [
                Person(name: "Stuka", age: 13, children: nil),
                Person(name: "Hanka", age: 30, children: nil)
            ]
        )
        
        let data: Data? = Serialization.encode(member)
        
        XCTAssert(data != nil)
        
        let res = try? Requests.put(url: url, body: data).get()
        
        XCTAssert(res != nil)
    }
    
    func testDelete() {
        
        let url = URL(string: apiUrl)!
        
        let res = try? Requests.delete(url: url).get()
        
        XCTAssert(res != nil)
    }
    struct Person: Codable {
        let name: String
        let age: Int
        let children: [Person]?
    }
}

