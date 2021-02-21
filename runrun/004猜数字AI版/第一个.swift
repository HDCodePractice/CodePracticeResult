
var inputNumber = askForNumber("来猜下？")
var count = 0
var number = 50
while number != inputNumber {
    if inputNumber<number{
        number-=1
        count+=1
    }else if inputNumber>number {
        number+=1
        count+=1
    }
    show("猜出了数字\(number),第\(count)次")
}
show("猜对了\(number),用了\(count)次")
