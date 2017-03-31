
//Given two temperatures, return true if one is less than 0 and the other is greater than 100.
func icyHot(firstTemp: Int, secondTemp: Int) -> Bool {

    if firstTemp < 0 && secondTemp > 100 {
        return true
    } else if firstTemp > 100 && secondTemp < 0 {
        return true
    }
    return false
}
func icyHot2(firstTemp: Int, secondTemp: Int) -> Bool {

    if (firstTemp < 0 && secondTemp > 100) || (firstTemp > 100 && secondTemp < 0) {
        return true
    }
    return false
}
func icyHot3(firstTemp: Int, secondTemp: Int) -> Bool {
    let firstIsBelowZero = firstTemp < 0
    let firstIsAbove100 = firstTemp > 100
    let secondIsBelowZero = secondTemp < 0
    let secondIsAbove100 = secondTemp > 100

    return (firstIsBelowZero && secondIsAbove100) || (firstIsAbove100 && secondIsBelowZero)
}



icyHot(firstTemp: 120, secondTemp: -1) == true
icyHot(firstTemp: -1, secondTemp: 120) == true
icyHot(firstTemp: 2, secondTemp: 120) == false
icyHot(firstTemp: 242, secondTemp: 65) == false
icyHot(firstTemp: 2, secondTemp: -1) == false
icyHot(firstTemp: -50, secondTemp: 65) == false


func equalsSeven(number: Int) -> Bool {
    return (number == 7)
}

equalsSeven(number: 7)
equalsSeven(number: 8)
equalsSeven(number: 49)

