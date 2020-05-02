let numbers = [2,3,4,5]
let numbersCount = numbers.count - 1 
var count = 0

for i in 0 ... numbersCount  {
    for j in 0 ... numbersCount {
        for k in 0 ... numbersCount {
            if numbers[i] != numbers[j] && numbers[i] != numbers[k] && numbers[j] != numbers[k] {
                count += 1
                show("\(count):\(numbers[i])\(numbers[j])\(numbers[k])😀")
            }
        }
    }
}
