//
//  Serialization.swift
//  Requests
//
//  Created by Emir Taletovic on 1/20/20.
//  Copyright © 2020 Emir Taletovic. All rights reserved.
//

import Foundation

public class Serialization {
    
    static let decoder = JSONDecoder()
    static let encoder = JSONEncoder()
    
    static func encode<T>(_ value: T) -> Data? where T : Encodable {
        return try? encoder.encode(value)
    }
    
    static func encode<T>(_ value: T) -> String? where T : Encodable {
        
        var jsonString: String? = nil
        
        if let jsonData = try? encoder.encode(value) {
            jsonString = String(data: jsonData, encoding: .utf8)
        }
        
        return jsonString;
    }
    
    static func decode<T>(_ type: T.Type, from data: Data) -> T? where T : Decodable {
        
        return try? decoder.decode(type, from: data)
    }
    
    static func decode<T>(_ type: T.Type, from jsonString: String) -> T? where T : Decodable {
        
        return decode(type, from: jsonString.data(using: .utf8)!)
    }
}

extension Data {
    
    func toObject<T: Decodable>() -> T? {
        
        Serialization.decode(T.self, from: self)
    }
}

extension Encodable {
    
    func toData()  -> Data? {
        
        Serialization.encode(self)
    }
}

