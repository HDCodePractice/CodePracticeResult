let number = Int.random(in: 0...999)
var numberOfTries = 0
var answer = 0

while answer != number {
    numberOfTries += 1
    let answerAsk = askForNumber()
    answer = answerAsk
    if answer < number {
        show("The number you are trying to guess is superior to your guess. Please try again. You have used \(numberOfTries) tries.")
    }
    if answer > number {
        show("The number you are trying to guess is inferior to your guess. Please try again. You have used \(numberOfTries) tries.")
    }
}
show("Good job! You have found out the number in \(numberOfTries) tries!")
