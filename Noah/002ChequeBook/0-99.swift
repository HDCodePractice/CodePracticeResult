func thingy(_ n : Int) -> String {
    var bruh = ""
    var b1 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve"]
    var b1dash = ["", " - One", " - Two", " - Three", " - Four", " - Five", " - Six", " - Seven", " - Eight", " - Nine"]
    var b2 = ["", "", "Twen", "Thir", "Four", "Fif", "Six", "Seven", "Eigh", "Nine"]
    var b3 = ["Hundred", "Thousand", "teen", "ty"]
    if n <= 12 {
        bruh.append("\(b1[n])")
    } else if n >= 13 && n <= 19 {
        bruh.append("\(b2[n%10])\(b3[3])")
    } else {
        bruh.append("\(b2[n/10])\(b3[3])\(b1dash[n%10])")
    }
    bruh.append(" Dollars")
    return bruh
}
for i in 0 ... 99 {
    show("$\(i) : \(thingy(i))")
}

