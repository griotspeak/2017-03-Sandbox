//
//  GameState.swift
//  Mastermind
//
//  Created by TJ Usiyan on 2017/01/20.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

enum State {
    case inProgress([Code])
}

public struct Code : ExpressibleByArrayLiteral {
    var value: [Color]
    var length: Int {
        return value.count
    }

    public init(_ value: [Color]) {
        self.value = value
    }

    public init(_ values: Color...) {
        self.init(values)
    }

    public init(arrayLiteral elements: Color...) {
        self.init(elements)
    }
}

extension Code : Equatable {
    public static func ==(lhs:Code, rhs:Code) -> Bool {
        return lhs.value == rhs.value
    }
}

extension Code {
    public struct Feedback : Equatable {
        let perfect: Int
        let imperfect: Int

        internal init(perfect: Int = 0, imperfect: Int = 0) {
            self.perfect = perfect
            self.imperfect = imperfect
        }

        internal init(guess: Code, answer: Code) throws {
            guard guess.value.count == answer.value.count else { throw Error.unequalCodeLength }

            let perfect = zip(guess.value, answer.value).reduce(0) {
                ($1.0 == $1.1) ? $0 + 1 : $0
            }
            let imperfect = Set(guess.value).intersection(Set(answer.value)).count - perfect

            self.init(perfect: perfect, imperfect: imperfect)
        }

        static func array(_ guesses: [Code], answer: Code) throws -> [Feedback] {
            return try guesses.flatMap { guess in
                try Feedback(guess: guess, answer: answer)
            }
        }

        public static func ==(lhs:Feedback, rhs:Feedback) -> Bool {
            return lhs.perfect == rhs.perfect && lhs.imperfect == rhs.imperfect
        }

        enum Error : Swift.Error {
            case unequalCodeLength
        }
    }
}



public enum ColorSet {
    case standard

    var colors: Set<Color> {
        switch self {
        case .standard:
            return [
                .red,
                .orange,
                .yellow,
                .green,
                .blue,
                .purple,
                .magenta,
                .lightGrey
            ]
        }
    }
}

public enum Color : Hashable {
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case magenta
    case lightGrey
}
