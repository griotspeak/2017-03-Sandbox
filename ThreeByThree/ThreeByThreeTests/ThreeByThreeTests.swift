//
//  ThreeByThreeTests.swift
//  ThreeByThreeTests
//
//  Created by TJ Usiyan on 2017/04/06.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import ThreeByThree

class ThreeByThreeTests: XCTestCase {
    // Write a type, player with two properties, name and symbol. There are two valid symbols: x and o.
    // Write a function, createPLayer, which accepts a name and a symbol, returns a player with the provided values if the provided name is non-empty…

    func testCreatePlayerWithNonemptyName() {
        let result = createPlayer(name: "Elizabeth", symbol: .x)
        let expected = Player(name: "Elizabeth", symbol: .x)
        XCTAssertEqual(result, expected)
    }

    //  …and returns nothing if the name was empty.
    func testCreatePlayerWithEmptyName() {
        let result = createPlayer(name: "", symbol: .x)
        let expected: Player? = nil
        XCTAssertEqual(result, expected)
    }


    // Write a type game which holds two players with differing symbols.
    func testCreateGameWithValidPlayers() {
        let liz = Player(name: "Elizabeth", symbol: .x)
        let bart = Player(name: "Bartholemeu", symbol: .o)

        let result = createGame(liz, bart)
        let expected: Game? = Game(liz, bart, moves: [])
        XCTAssertEqual(result, expected)
    }

    // Write a type game which holds two players with differing symbols.
    func testCreateGameWithInvalidPlayers() {
        let liz = Player(name: "Elizabeth", symbol: .x)
        let bart = Player(name: "Bartholemeu", symbol: .x)

        let result = createGame(liz, bart)
        let expected: Game? = nil
        XCTAssertEqual(result, expected)
    }

    // Add a property, moves, to the type Game. A move should exist of a player and a location within a 3 x 3 grid
    // write a function, play, which accepts a player, a location, and a game and returns a new game with a move for the provided player at the provided location added to the moves property of the game.

    func testPlay() {

        //    0 | 1 | 2
        //   -----------
        //    3 | 4 | 5
        //   -----------
        //    6 | 7 | 8

        let liz = Player(name: "Elizabeth", symbol: .x)
        let bart = Player(name: "Bartholemeu", symbol: .o)
        let game = Game(liz, bart, moves: [])

        let result = play(player: liz, location: 4, game: game)
        let expected = Game(liz, bart, moves: [(playerSymbol: .x, location: 4)])
        XCTAssertEqual(result, expected)

    }

    // write a function, symbol(at location: Location, in game: Game ) 
    func testSymbolAtOccupiedLocation() {
        let liz = Player(name: "Elizabeth", symbol: .x)
        let bart = Player(name: "Bartholemeu", symbol: .o)
        let game = Game(liz, bart, moves: [(playerSymbol: .x, location: 4), (playerSymbol: .o, location: 2)])
        let result = symbol(at: 4, in: game)
        let expected: Symbol = .x

        XCTAssertEqual(result, expected)
    }

    func testSymbolAtUnoccupiedLocation() {
        let liz = Player(name: "Elizabeth", symbol: .x)
        let bart = Player(name: "Bartholemeu", symbol: .o)
        let game = Game(liz, bart, moves: [(playerSymbol: .x, location: 4), (playerSymbol: .o, location: 2)])
        let result = symbol(at: 0, in: game)
        let expected: Symbol? = nil

        XCTAssertEqual(result, expected)
    }
}

