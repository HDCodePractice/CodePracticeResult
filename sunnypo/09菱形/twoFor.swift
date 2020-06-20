var number = askForNumber("how tall would you like to make your triangle?")
func printing() {
    var d = ""
    for i in 1 ... number{
        var c = ""
        if number != i{
            for j in 1 ... number - i{
                c += " "
            }
        }
        for j in 1 ... i*2-1{
            c += "."
        }
        d += "\(c)\n"
    }
    for i in 1 ... number - 1{
        var c = ""
        if number != i{
            for j in 1 ... i{
                c += " "
            }
        }
        for j in 1 ... (number-i)*2-1{
            c += "."
        }
        d += "\(c)\n"
    }
    show(d)
}
printing()
