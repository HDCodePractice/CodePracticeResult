var lalala = 1
let number = Int.random(in: 0 ... 99)
var inputNumber = askForNumber("来猜下？")
while inputNumber != number {
    if number>inputNumber {
        show("你猜小啦")
    }
    if number<inputNumber {
        show("你猜大啦")
    }
    inputNumber = askForNumber("来猜下？")
    lalala+=1
}
show("恭喜你猜对啦！\(lalala)次")
