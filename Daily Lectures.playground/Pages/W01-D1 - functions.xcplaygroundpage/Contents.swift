print("Hello")

// functions without parameters or return values
func sayHello() {
    print("Hello!")
}

sayHello()

// functions with one labelled parameter and no return values
func sayHello(person: String) {
    print("Hello \(person)!")
}

sayHello(person: "Ali")
sayHello(person: "Crystal")
sayHello(person: "Brent")
sayHello(person: "Kaya")
sayHello(person: "Tennant")
sayHello(person: "Levar")

// functions with external label, one parameter, and no return value
func sayHello(to person: String) {
    print("Hello \(person)!")
}

sayHello(to: "Dolly")
