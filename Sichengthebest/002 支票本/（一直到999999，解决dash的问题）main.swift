var nbs0To19Dash = ["","-one","-two","-three","-four","-five","-six","-seven","-eight","-nine"]
var nbs0To19 = ["","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
var nbs20To99 = ["","","twenty","thirty"," forty","fifty","sixty","seventy","eighty","ninety"]
var english = ""

func translator(_ number: Int) -> String {
    var unitDigit = number-Int(number/100)*100
    var checkTwenty = unitDigit
    if unitDigit > 19 {
        unitDigit -= Int(unitDigit/10)*10
    }
    var unitDigitForHundredThousands = Int(number/1000)-Int(number/100000)*100
    var checkTwentyForHundredThousands = unitDigitForHundredThousands
    if unitDigitForHundredThousands > 19 {
        unitDigitForHundredThousands -= Int(unitDigitForHundredThousands/10)*10
    }
    if number < 20 {
        english = nbs0To19[number]
    } else if number > 19 && number < 100 {
        english = nbs20To99[Int(number/10)] + nbs0To19Dash[Int(number%10)]
    } else if number > 99 && number < 1000 {
        english = "\(nbs0To19[Int(number/100)]) hundred \(nbs20To99[(number-(Int(number/100)*100))/10])"
        if checkTwenty < 20 {
            english.append("\(nbs0To19[unitDigit])")
        } else {
            english.append("\(nbs0To19Dash[unitDigit])")
        }
    } else if number > 999 && number < 20000 {
        english = "\(nbs0To19[Int(number)/1000]) thousand \(nbs0To19[Int((number-Int(number/1000)*1000)/100)])"
        if number-Int(number/1000)*1000 > 100 {
            english.append(" hundred \(nbs20To99[(number-(Int(number/100)*100))/10])")
            if checkTwenty < 20 {
                english.append("\(nbs0To19[unitDigit])")
            } else {
                english.append("\(nbs0To19Dash[unitDigit])")
            }
        } else {
            english.append("\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[unitDigit])")
        }
    } else if number > 19999 && number < 100000 {
        english = "\(nbs20To99[Int(number/10000)])\(nbs0To19Dash[Int((number-Int(number/10000)*10000)/1000)]) thousand \(nbs0To19[Int((number-Int(number/1000)*1000)/100)])"
        if number-Int(number/1000)*1000 > 100 {
            english.append(" hundred \(nbs20To99[(number-(Int(number/100)*100))/10])")
            if checkTwenty < 20 {
                english.append("\(nbs0To19[unitDigit])")
            } else {
                english.append("\(nbs0To19Dash[unitDigit])")
            }
        } else {
            english.append("\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[unitDigit])")
        }
    } else if number > 99999 && number < 1000000 {
        var result = ""
        if checkTwentyForHundredThousands < 20 {
            result = nbs0To19[unitDigitForHundredThousands]
        } else {
            result = nbs0To19Dash[unitDigitForHundredThousands]
        }
        english = "\(nbs0To19[Int(number/100000)]) hundred \(nbs20To99[(Int(number/1000)-Int(number/100000)*100-unitDigitForHundredThousands)/10])" + result + " thousand \(nbs0To19[Int((number-Int(number/1000)*1000)/100)])"
        if number-Int(number/1000)*1000 > 100 {
            english.append(" hundred \(nbs20To99[(number-(Int(number/100)*100))/10])")
            if checkTwenty < 20 {
                english.append("\(nbs0To19[unitDigit])")
            } else {
                english.append("\(nbs0To19Dash[unitDigit])")
            }
        } else {
            english.append("\(nbs20To99[(number-(Int(number/100)*100))/10])")
            if checkTwenty < 20 {
                english.append("\(nbs0To19Dash[unitDigit])")
            }
            english.append("\(nbs0To19[unitDigit])")
        }
    } else if number > 1000000 && number < 1 {
        english = "You have passed the calculator's maximum capacity. Please insert another sum of money."
    }
    if number == 1 {
        english.append(" dollar")
    } else {
        english.append(" dollars")
    }
    return english
}

show(translator(1))
show(translator(11))
show(translator(21))
show(translator(101))
show(translator(111))
show(translator(1001))
show(translator(1011))
show(translator(1111))
show(translator(1234))
show(translator(10001))
show(translator(11111))
show(translator(12345))
show(translator(100001))
show(translator(111111))
show(translator(987654))
show(translator(1003490))
