let randomNumber = Int.random(in:0...999)
var answer = 0
var time = 0
while answer != randomNumber{
    time += 1
    var answer1 = askForNumber("please enter your number")
    if answer1 < randomNumber{
        show("the answer is larger than you expected, it is the \(time) time")
    }else if answer1 > randomNumber{
        show("the answer is smaller than you expected, it is the \(time) time")
    }
    answer = answer1
}
show("yes, the number is \(randomNumber), you have use \(time) time to solve it")
