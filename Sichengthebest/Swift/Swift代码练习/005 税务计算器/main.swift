let answer = askForNumber("Annual income")

if answer < 47630 {
    show("Your government taxes are: \(answer/100*15)$")
} else if answer >= 47630 && answer < 95259 {
    show("Your government taxes are: \(Int(Double(answer/100)*20.5))$")
} else if answer >= 95259 && answer < 147667 {
    show("Your government taxes are: \(answer/100*26)$")
} else if answer >= 147667 && answer < 210371 {
    show("Your government taxes are: \(answer/100*29)$")
} else if answer >= 210371 {
    show("Your government taxes are: \(answer/100*33)$")
}

if answer < 43790 {
    show("Your provincial taxes are: \(answer/100*15)$")
} else if answer >= 43790 && answer < 87575 {
    show("Your provincial taxes are: \(answer/100*20)$")
} else if answer >= 87575 && answer < 106555 {
    show("Your provincial taxes are: \(answer/100*24)$")
} else if answer >= 106555 {
    show("Your provincial taxes are: \(Int(Double(answer/100)*25.75))$")
}
