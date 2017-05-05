// Find the sum of all the multiples of 3 or 5 below 1000.
// of: Set<Int>,
func sumMultiplesOfThreeOrFive(upTo upperLimit: Int) -> Int {
    let multiples = Array(0..<upperLimit).filter { element in
        ((element % 3) == 0) || ((element % 5) == 0)
    }
    return multiples.reduce(0, +)
}



sumMultiplesOfThreeOrFive(upTo: 10) == 23
sumMultiplesOfThreeOrFive(upTo: 1000)

let number = 4_000_000
var memo: [Int:Int] = [:]

func fib(_ n: Int) -> Int {
    if let answer = memo[n] {
        return answer
    }

    guard n >= 0 else {
        fatalError("Negative fib numbers are not supported")
    }

    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }

    let back = fib(n - 1) + fib(n - 2)
    memo[n] = back
    return back
}

fib(0)
fib(1)
fib(2)
fib(3)
fib(4)

var currentIndex = 0
var currentFib = fib(currentIndex)

var sum = 0
while currentFib < 4_000_000 {
    if currentFib % 2 == 0 {
        sum += currentFib
    }

    currentIndex += 1
    currentFib = fib(currentIndex)
}
print(sum)
// for more on fib in swift [Advanced Swift - WWDC 2014 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2014/404/)
