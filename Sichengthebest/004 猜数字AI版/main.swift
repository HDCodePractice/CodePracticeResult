let number = Int.random(in: 0...999)
var numberOfTries = 0
var answer = 500
while answer != number {
    if answer < number {
        answer += Int(answer/21)
    } else if answer > number {
        answer -= Int(answer/21)
    }
    numberOfTries += 1
    show(answer)
}
show("Good job! You have found out the number in \(numberOfTries) tries!")
