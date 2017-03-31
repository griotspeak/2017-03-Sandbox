enum Status {
    case early(Int)
    case onTime
    case late(Int)
}

let myFirstFlight: Status = .onTime
let mySecondFlight = Status.late(5)

func simplePrint(_ status:Status ) {
    switch status {
    case .early:
        print("We're gonna have time to spare!")
    case .onTime:
        print("We'll just make it!")
    case .late:
        print("Oh no.")
    }
}

func clearerPrint(_ status:Status ) {
    switch status {
    case .early(let amount):
        print("We are \(amount) minutes early")
    case .onTime:
        
        print("We are on time")
    case .late(let amount):
        print("We are \(amount) minutes late")
    }
}


simplePrint(myFirstFlight)
simplePrint(mySecondFlight)
print("----")
clearerPrint(myFirstFlight)
clearerPrint(mySecondFlight)