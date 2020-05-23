let numbers = [1,2,3,4]
let numbersCount = numbers.count-1
var count = 0

func getNumber(n: Int, bit: Int){
    for i in numbers {
        var sortedNumbers = ""
        if n == 0 {
            sortedNumbers = "\(i)"
        } else {
            sortedNumbers = "\(i)\(n)"
        }
        
        if bit == numbersCount {
            if Array(sortedNumbers).count == Set(sortedNumbers).count {
                count += 1
                show("Number \(count): \(sortedNumbers)")
            }
        } else {
            getNumber(n: Int(sortedNumbers) ?? 0, bit: bit + 1)
        }
    }
}
show("We will calculate a \(numbersCount)-digit number")
getNumber(n: 0, bit: 1)
show("There are \(count) numbers.")
