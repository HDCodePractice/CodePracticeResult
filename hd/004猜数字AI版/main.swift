func halfNumber(start: Int,end: Int) -> Int{
    return Int((end - start) / 2 ) + start
}

let randomNumber = Int.random(in: 0...999)
var inputNumber: Int = halfNumber(start: 0, end: 1000)
var maxNumber = 1000
var miniNumber = 0
var inputCount = 1

while inputNumber != randomNumber {
    let lastInputNumber = inputNumber
    if inputNumber > randomNumber {
        show("AI认为是\(inputNumber)比\(randomNumber)要大，已经用了\(inputCount)次了!")
        // 当随机数为200时，取0...500的中间数
        inputNumber = halfNumber(start: miniNumber, end: inputNumber)
        // 接下来不再考虑500以上的数字
        maxNumber = lastInputNumber
        show("\(miniNumber)...\(maxNumber)")
    }else{
        show("AI认为是\(inputNumber)比\(randomNumber)要小，已经用了\(inputCount)次了!")
        // 当随机数为600时，取500...1000的中间数
        inputNumber = halfNumber(start: inputNumber, end: maxNumber)
        // 接下来不再考虑500以下的数字
        miniNumber = lastInputNumber
        show("\(miniNumber)...\(maxNumber)")
    }
    inputCount += 1
}
show("Bingo!AI终于猜对了\(randomNumber)，竟然使用了\(inputCount)次！")
