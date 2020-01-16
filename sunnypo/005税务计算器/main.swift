let number = askForNumber("Please enter your annual salary(in dollars)")
var resultQC = 0
var resultUN = 0
let percentUN = [0,3300,2900,2500,1500]
let valueUN = [0,210371,95259,47630,0]
let percentQC = [0,2575,2400,2000,1500]
let valueQC = [0,106555,87575,43790,0]
var a = 0
func caculate(value:Int,percent:Int,i:Int) -> Int {
    if number >= value {
        return (number-value-(a*(number-i)))*percent/10000
    } else {
        return 0
    }
}
for i in 1 ... 4 {
    resultQC += caculate(value: valueQC[i], percent: percentQC[i], i: valueQC[i-1])
    if resultQC > 0{
        a = 1
    }
}
a = 0
for i in 1 ... 4 {
    resultUN += caculate(value: valueUN[i], percent: percentUN[i], i: valueUN[i-1])
    if resultUN > 0{
        a = 1
    }
}
show("Your should pay $\(resultQC) of tax a year to Quebec government and $\(resultUN) to Union, totally it is $\(resultUN+resultQC).")
