func trans(number: Int) -> String{
    var tran = ["Zero","One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty"]
    return "\(tran[number]) Dollars"
}

for i in 0 ... 20 {
    show("\(i) : \(trans(number: i))")
}
