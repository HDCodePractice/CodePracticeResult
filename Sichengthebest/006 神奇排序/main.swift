let x = Int.random(in: 0...9999)
let y = Int.random(in: 0...9999)
let z = Int.random(in: 0...9999)
var numbers: [Int] = []

if x < y {
    numbers.insert(x, at: 0)
    numbers.insert(y, at: 1)
} else if y < x {
    numbers.insert(y, at: 0)
    numbers.insert(x, at: 1)
}
if z < numbers[0] {
    numbers.insert(z, at: 0)
} else if z > numbers[0] && z < numbers[1] {
    numbers.insert(z, at: 1)
} else if z > numbers[1] {
    numbers.append(z)
}
show("This is the first number: \(numbers[0])\nThis is the second number: \(numbers[1])\nThis is the third number: \(numbers[2])")
