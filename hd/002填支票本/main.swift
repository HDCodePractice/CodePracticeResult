let NUMBER_CONSTANT = ["zero ","one","two","three","four","five","six","seven","eight", "nine", "ten", "eleven", "twelve", "thirteen","fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" ]
let IN_HUNDRED_CONSTANT = ["","","twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

func translateNumberToEnglish(number : Int) -> String{
    var engStr = ""
    if number < 20 {
        engStr = "\(engStr) \(NUMBER_CONSTANT[number])"
    }else{
        let d1 = number / 10  // 十位数
        let d2 = number % 10  // 个位数
        engStr = "\(IN_HUNDRED_CONSTANT[d1]) \(NUMBER_CONSTANT[d2])"
    }
    return engStr
}

show(1)
show(translateNumberToEnglish(number: 1))
show(19)
show(translateNumberToEnglish(number: 19))
show(25)
show("25 ",translateNumberToEnglish(number: 25))
