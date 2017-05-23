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

            var imperfect = 0
            let imperfectOrIncorrect = zip(guess.value, answer.value).filter { $0 != $1 }

            var answerAnalysis: [Color: Int] = [:]
            var guessAnalysis: [Color: Int] = [:]

            for (guessPeg, answerPeg) in imperfectOrIncorrect {
                if let currentCount = answerAnalysis[answerPeg] {
                    answerAnalysis[answerPeg] = currentCount + 1
                } else {
                    answerAnalysis[answerPeg] = 1
                }

                if let currentCount = guessAnalysis[guessPeg] {
                    guessAnalysis[guessPeg] = currentCount + 1
                } else {
                    guessAnalysis[guessPeg] = 1
                }
            }

            for (color, guessCount) in guessAnalysis {
                let answerCount = answerAnalysis[color] ?? 0
                imperfect += min(guessCount, answerCount)
            }

            let perfect = answer.length - imperfectOrIncorrect.count

            self.init(perfect: perfect, imperfect: imperfect)
        }

        static func array(_ guesses: [Code], answer: Code) throws -> [Feedback] {
            return try guesses.map { guess in
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
