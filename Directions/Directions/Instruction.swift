//
//  Instruction.swift
//  Directions
//
//  Created by TJ Usiyan on 2017/03/31.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

typealias Location = (x: Int, y: Int)

enum Instruction {
    case left
    case right
}


func turn(_ instruction: Instruction, fromFacing original: CardinalDirection) -> CardinalDirection {
    return .north // default bad implementation
}
