//
//  FileTests.swift
//  Tests
//
//  Created by Emir Taletovic on 2/3/20.
//  Copyright © 2020 Emir Taletovic. All rights reserved.
//

import XCTest
@testable import Requests

class FileTests: XCTestCase {
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetImageAndSaveToFile() {
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/e/e9/Felis_silvestris_silvestris_small_gradual_decrease_of_quality.png")!
                
        let res = try? Requests.get(url: url)
        
        //TODO: implement saving to file. Get only supports String atm
        
    }
    
   
}
