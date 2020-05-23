let numbers = [1,2,3,4]
let numbersCount = numbers.count - 1 
var count = 0

func getUltraNumber(n: Int, bit: Int) {
    for omg in numbers {
        var a = ""
        if n == 0 {
            a = "\(omg)"
        } else {
            a = "\(omg)\(n)"
        }
        if bit == numbersCount {
            if Array(a).count == Set(a).count {
                count += 1
                show(a)
            }
        } else {
            getUltraNumber(n: Int(a) ?? 0, bit: bit + 1 )
        }
    }
}
getUltraNumber(n: 0, bit: 1)
show("Il y a \(count)")
