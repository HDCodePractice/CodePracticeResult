var nbs0To19 = [""," one"," two"," three"," four"," five"," six"," seven"," eight"," nine"," ten"," eleven"," twelve"," thirteen"," fourteen"," fifteen"," sixteen"," seventeen"," eighteen"," nineteen"]
var nbs20To99 = ["",""," twenty"," thirty"," forty"," fifty"," sixty"," seventy"," eighty"," ninety"]
var english = ""
func translator(number: Int) {
    var strangeInt = number-Int(number/100)*100
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
    } else if number > 1000000 {
        show("You have passed the calculator's maximum capacity. Please insert another sum of money.")
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
    }
}
translator(number: 1)
show(english)
translator(number: 5)
show(english)
translator(number: 10)
show(english)
translator(number: 15)
show(english)
translator(number: 19)
show(english)
translator(number: 29)
show(english)
translator(number: 39)
show(english)
translator(number: 49)
show(english)
translator(number: 59)
show(english)
translator(number: 69)
show(english)
translator(number: 79)
show(english)
translator(number: 89)
show(english)
translator(number: 99)
show(english)
translator(number: 150)
show(english)
translator(number: 250)
show(english)
translator(number: 350)
show(english)
translator(number: 432)
show(english)
translator(number: 555)
show(english)
translator(number: 666)
show(english)
translator(number: 737)
show(english)
translator(number: 812)
show(english)
translator(number: 999)
show(english)
translator(number: 1001)
show(english)
translator(number: 12345)
show(english)
translator(number: 99999)
show(english)
translator(number: 123456)
show(english)
