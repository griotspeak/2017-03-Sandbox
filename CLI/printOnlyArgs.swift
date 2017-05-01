//
//  printOnlyArgs.swift
//  
//
//  Created by TJ Usiyan on 2017/05/01.
//
//

import Foundation
let allArguments = CommandLine.arguments
let secondIndex = allArguments.index(after: allArguments.startIndex)
let withoutFirst = allArguments[secondIndex..<allArguments.endIndex]


print(withoutFirst)
