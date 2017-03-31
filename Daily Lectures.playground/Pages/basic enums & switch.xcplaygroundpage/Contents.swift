
// this is nice  because we are sure that we have covered all cases
let isDay: Bool = false
if isDay { // case 1
    print("wait")
} else { // case 2
    print("party")
}

enum TrainStatus {
    case early
    case onTime
    case late
}

let scheduledTime = 9
let actualTime = 12
let currentStatus: TrainStatus

if actualTime < scheduledTime {
    currentStatus = .early
} else if actualTime > scheduledTime {
    currentStatus = .late
} else {
    currentStatus = .onTime
}

print("we are", currentStatus)


// this too! is nice  because we are sure that we have covered all cases
switch currentStatus {
case .early:
    print("We're gonna have time to spare!")
case .onTime:
    print("We'll just make it!")
case .late:
    print("Oh no.")
}

