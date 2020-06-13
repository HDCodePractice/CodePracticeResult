var number = askForNumber("how tall would you like to make your triangle?")
func printing() {
    for i in 1 ... number{
        var c = ""
        if number != i{
            for j in 1 ... number - i{
                c += " "
            }
        }
        for j in 1 ... i*2-1{
            c += "*"
        }
        show(c)
    }
}
printing()
