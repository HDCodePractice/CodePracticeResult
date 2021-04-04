var nbs0To19 = [""," one"," two"," three"," four"," five"," six"," seven"," eight"," nine"," ten"," eleven"," twelve"," thirteen"," fourteen"," fifteen"," sixteen"," seventeen"," eighteen"," nineteen"]
var nbs20To99 = ["",""," twenty"," thirty"," forty"," fifty"," sixty"," seventy"," eighty"," ninety"]
var english = ""
var strangeInt = number-Int(number/100)*100

func translator(number: Int) {
    if number < 20 {
        english = nbs0To19[number]
    } else if number > 19 && number < 100 {
        english = nbs20To99[Int(number/10)] + nbs0To19[Int(number%10)]
    } else if number > 99 && number < 1000 {
        if strangeInt > 19 {
            strangeInt -= Int(strangeInt/10)*10
        }
        english = "\(nbs0To19[Int(number/100)]) hundred\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[strangeInt])"
    } else if number > 999 && number < 20000 {
        if strangeInt > 19 {
            strangeInt -= Int(strangeInt/10)*10
        }
        english = "\(nbs0To19[Int(number)/1000]) thousand\(nbs0To19[Int((number-Int(number/1000)*1000)/100)])"
        if number-Int(number/1000)*1000 > 100 {
            english.append(" hundred\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[strangeInt])")
        } else {
            english.append("\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[strangeInt])")
        }
    } else if number > 19999 && number < 100000 {
        if strangeInt > 19 {
            strangeInt -= Int(strangeInt/10)*10
        }
        english = "\(nbs20To99[Int(number/10000)])\(nbs0To19[Int((number-Int(number/10000)*10000)/1000)]) thousand\(nbs0To19[Int((number-Int(number/1000)*1000)/100)])"
        if number-Int(number/1000)*1000 > 100 {
            english.append(" hundred\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[strangeInt])")
        } else {
            english.append("\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[strangeInt])")
        }
    } else if number > 99999 && number < 1000000 {
        var strangeIntForHundredThousands = Int(number/1000)-Int(number/100000)*100
        if strangeInt > 19 {
            strangeInt -= Int(strangeInt/10)*10
        }
        
        if strangeIntForHundredThousands > 19 {
            strangeIntForHundredThousands -= Int(strangeIntForHundredThousands/10)*10
        }
        english = "\(nbs0To19[Int(number/100000)]) hundred\(nbs20To99[(Int(number/1000)-Int(number/100000)*100-strangeIntForHundredThousands)/10])\(nbs0To19[strangeIntForHundredThousands]) thousand\(nbs0To19[Int((number-Int(number/1000)*1000)/100)])"
        if number-Int(number/1000)*1000 > 100 {
            english.append(" hundred\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[strangeInt])")
        } else {
            english.append("\(nbs20To99[(number-(Int(number/100)*100))/10])\(nbs0To19[strangeInt])")
        }
    } else if number > 1000000 && number < 1 {
        show("You have passed the calculator's maximum capacity. Please insert another sum of money.")
    }
    if number == 1 {
        english.append(" dollar")
    } else {
        english.append(" dollars")
    }
}

let number = askForNumber("Annual revenue")
translator(number: number)
show(english)
