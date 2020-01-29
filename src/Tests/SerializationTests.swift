//
//  Tests.swift
//  Tests
//
//  Created by Emir Taletovic on 1/20/20.
//  Copyright © 2020 Emir Taletovic. All rights reserved.
//

import XCTest
@testable import Requests



class SerializationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. Thåis method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEncode() {

        let p = Person(name: "Test", age: 20, children: [])
        let encoded: Data? = Serialization.encode(p)

        XCTAssert(encoded != nil)
    }
    func testDecode() {

        let p = Person(name: "Test", age: 20, children: [])
        let encoded: Data = Serialization.encode(p)!
        
        let decoded = Serialization.decode(Person.self, from: encoded)!

        XCTAssert(decoded.name == "Test")
        XCTAssert(decoded.age == 20)
    }
    
    func testStringSerialization() {
        
        let p = Person(name: "Test", age: 20, children: [])

        if let jsonString: String = Serialization.encode(p) {
            
            if let person = Serialization.decode(Person.self, from: jsonString) {
                XCTAssert(person.age == 20)
                XCTAssert(person.name == "Test")
                return;
            }
            
        }
        XCTFail()
        
    }

    struct Person: Codable {
        let name: String
        let age: Int
        let children: [Person]?
    }
}


