func countDown(from value: Int) {
    print(value)
    if value > 0 {
        countDown(from: value - 1)
    }
}

countDown(from: 10)
