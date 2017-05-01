//
//  simpleSum.swift
//  
//
//  Created by TJ Usiyan on 2017/05/01.
//
//
import Darwin

let withoutFirst = CommandLine.arguments.dropFirst()

func exitScript(_ code: Int32) -> Never {
    print("exiting early with error code: \(code)")
    exit(code)
}

guard withoutFirst.count == 2 else {
    print("Incorrect number of arguments. Expected 2. Received \(withoutFirst.count)")
    exitScript(Int32(#line))
}

let integers = withoutFirst.flatMap { Int($0) }

guard integers.count == 2 else {
    print("Expected 2 integer arguments")
    exitScript(Int32(#line))
}

print(integers[0] + integers[1])
