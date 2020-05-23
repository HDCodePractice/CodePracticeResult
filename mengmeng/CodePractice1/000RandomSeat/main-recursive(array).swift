let numbers = [1, 2, 3]
let numbersCount = numbers.count - 1
var count = 0
func getNumbers(n: Int, bit: Int) {
    for i in numbers {
        var a = ""
        if n == 0 {
            a = "\(i)"
        } else {
            a = "\(i)\(n)"
        }
        if bit == numbersCount {
            if Array(a).count == Set (Array(a)).count {
                count += 1
                show("This is the \(count) one's result:\(a)")
            } 
        }else {
            getNumbers(n: Int(a) ?? 0 , bit : bit + 1)
        }
    }
}
getNumbers(n: 0, bit: 1)
show("This is the \(count) one's result: \(count)")
