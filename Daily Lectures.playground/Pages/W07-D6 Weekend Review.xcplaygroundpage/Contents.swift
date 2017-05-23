// MARK: - `@escaping`

struct ActionRepeater {
    let closure: () -> Int

    // must be marked as @escaping because the closure outlives the scope of the function that we are passing it into.
    init(closure: @escaping () -> Int) {
        self.closure = closure
    }
}
