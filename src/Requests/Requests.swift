//
//  Requests.swift
//  Requests
//
//  Created by Emir Taletovic on 1/20/20.
//  Copyright © 2020 Emir Taletovic. All rights reserved.
//
import Foundation

public struct Requests {
    
    static var session: URLSession = URLSession(configuration: .default, delegate: nil, delegateQueue:  OperationQueue())
    
    public static func get(url: URL, timeoutInSeconds: Double = 15) -> Result<String?, NetworkError> {
        
        request(url: url, body: nil, httpMethod: "GET", timeoutInSeconds: timeoutInSeconds)
    }
    
    public static func post(url: URL, body: Data?, timeoutInSeconds: Double = 15) -> Result<String?, NetworkError> {
        
        request(url: url, body: body, httpMethod: "POST", timeoutInSeconds: timeoutInSeconds)
    }
    
    public static func put(url: URL, body: Data?, timeoutInSeconds: Double = 15) -> Result<String?, NetworkError> {
        
        request(url: url, body: body, httpMethod: "PUT", timeoutInSeconds: timeoutInSeconds)
    }
    
    public static func delete(url: URL, timeoutInSeconds: Double = 15) -> Result<String?, NetworkError> {
        request(url: url, body: nil, httpMethod: "DELETE", timeoutInSeconds: timeoutInSeconds)
    }
    
    public static func request(url: URL, body: Data?, httpMethod: String, timeoutInSeconds: Double) -> Result<String?, NetworkError> {
        
        var urlRequest = URLRequest(url: url, timeoutInterval: timeoutInSeconds)
        urlRequest.httpBody = body
        urlRequest.httpMethod = httpMethod
                
        return request(urlRequest: urlRequest, body: body, httpMethod: httpMethod, timeoutInSeconds: timeoutInSeconds)
    }
    
    public static func request(urlRequest: URLRequest, body: Data?, httpMethod: String, timeoutInSeconds: Double) -> Result<String?, NetworkError> {
        
        var result: Result<String?, NetworkError>!
        let semaphore = DispatchSemaphore(value: 0)
        let task = session.dataTask(with: urlRequest) { (data, _, _) in
            if let data = data {
                result = .success(String(data: data, encoding: .utf8))
            } else {
                result = .failure(.server)
            }
            semaphore.signal()
        }
        task.resume()
        
        _ = semaphore.wait(wallTimeout: .distantFuture)
        
        return result
    }
    
    public enum NetworkError: Error {
        case url
        case server
        case timeout
    }
}
