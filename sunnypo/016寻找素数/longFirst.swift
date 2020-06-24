var m = askForNumber("Smaller Number")
var n = askForNumber("Bigger Number")
var numbers : [Int] = []
var final : [Int] = []
func find() {
    for i in numbers{
        if i > 2 {
            for j in 2 ... i - 1{
                if i % j == 0{
                    break
                }else if j == i - 1{
                    final.append(i)
                }
            }
        }else if i == 2{
            final.append(i)
        }
    }
}
if m > n {
    show("Please enter the Smaller number first.")
}else{
    for i in m ... n{
        numbers.append(i)
    }
    find()
}
show("\(final)")
