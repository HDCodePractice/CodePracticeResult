func trans(_ number: Int) -> String{
    var tran0to100 = [
        ["Zero","One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty"],
        ["","-One", "-Two", "-Three", "-Four", "-Five", "-Six", "-Seven", "-Eight", "-Nine", "-Ten", "-Eleven", "-Twelve", "-Thirteen", "-Fourteen", "-Fifteen", "-Sixteen", "-Seventeen", "-Eighteen", "-Nineteen", "-Twenty"],
        ["Twenty"],
        ["Thirty"],
        ["Forty"],
        ["Fifty"],
        ["Sixty"],
        ["Seventy"],
        ["Eighty"],
        ["Ninety"]]
    
    if number < 20{
        return "\(tran0to100[0][number]) Dollars"
    }else{
        return "\(tran0to100[Int(number / 10) ][0])\(tran0to100[1][number % 10]) Dollars"
    }
}

for i in 0 ... 99 {
    show("\(i) : \(trans(i))")
}
