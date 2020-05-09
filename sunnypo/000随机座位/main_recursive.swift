var a = 1
func qwertyui (number: Int, bit: Int) -> Int {
    if bit > 1 {
        for b in 1...bit {
            a = a * number 
        }
    }
    return a
}
show(qwertyui(number: 2, bit: -5))
