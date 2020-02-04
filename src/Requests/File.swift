//
//  File.swift
//  Requests
//
//  Created by Emir Taletovic on 2/3/20.
//  Copyright © 2020 Emir Taletovic. All rights reserved.
//

import Foundation

extension Data {
    func writeToFile(file: URL) -> Bool {

        do {
            try self.write(to: file, options: [.atomic])
            return true
        }
        catch {
            return false
        }
    }
}

func getDocumentsDirectory() -> URL {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
}
