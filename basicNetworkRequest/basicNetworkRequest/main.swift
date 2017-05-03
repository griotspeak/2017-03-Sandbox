//
//  main.swift
//  basicNetworkRequest
//
//  Created by TJ Usiyan on 2017/05/03.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

// because this is a CLI tool
var keepRunning = true

if let url = URL(string: "http://www.codingbat.com") {
    let session = URLSession.shared

    let task = session.dataTask(with: url) { (optionalData, optionalResponse, optionalError) in
        print(String(describing: optionalData))
        print(String(describing: optionalResponse))
        print(String(describing: optionalError))
        keepRunning = false
    }

    task.resume()
}

while keepRunning {
}
